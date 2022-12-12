<#
.DESCRIPTION

Generador de Instaladores del HUB, una vez finalizado el procesamiento
Busque su instalador(.exe) en la carpeta dist.

.PARAMETER nameInstaller
Especifica el nombre del instalador del HUB

.PARAMETER plugins
Especifica los plugins que contiene el instalador del HUB,
debe ser ingresado con la sintaxis de hashtables.

.PARAMETER genInstaller
Especifica con valor booleanos si deseamos generar un instalador 
del HUB o unicamente crear todas las carpetas y archivos correspondientes

.PARAMETER configPath
Especifica el archivo de configuracion relativo a la carpeta ext
configPath.txt, el uso de este archivo de configuracion es opcional
#>


param(
    [String]$nameInstaller,
    [hashtable[]]$plugins,
    [Parameter(Mandatory)]
    [string]$genInstaller,
    [String]$configPath
)

function build([String]$nameInstaller,[hashtable[]]$plugins,[string]$genInstaller){
    <# template creado para ir completando spec.iss#>
    $tempIss = "#include "+"""..\common\base.iss""`n" +
           "#include "+"""..\common\cert\isa.iss""`n`n" +
           "[Setup]`n" +
           "OutputBaseFilename=iSCertHubInstaller"+$nameInstaller+"`n`n" +
           "[Files]"

    <#CORROBORA QUE TODOS LOS PLUGINS INGRESADOS EXISTAN EN LA CARPETA LIB#>
    if($plugins.Count -eq 0){
        Throw "Ingrese Plugins a instalar"
        Exit
    }

    foreach($plg in $plugins){
         if(-Not (Test-Path .\lib\$($plg.jar))){
            Throw "VERIFICAR CARPETA LIB, FALLA INTENTANDO ENCONTRAR EL PLUGIN: " + $($plg.jar)
            Exit
         }
         if(-Not ($($plg.service).length -gt 0)){
            Throw "FALTA EL ARGUMENTO SERVICE PARA EN ALGUNO DE LOS PLUGINS " 
			Exit
         }
         if(-Not ($($plg.name).length -gt 0)){
            Throw "FALTA EL ARGUMENTO NAME PARA EN ALGUNO DE LOS PLUGINS"
			Exit
         }
    }


    <#CREO LAS CARPETAS CORRESPONDIENTES#>
    New-Item .\plane\plugins\$nameInstaller -ItemType Directory
    New-Item .\plane\plugins\$nameInstaller\service.yml

    Add-Content .\plane\plugins\$nameInstaller\service.yml -Value 'plugins:'

    New-Item ..\$nameInstaller -ItemType Directory
    New-Item ..\$nameInstaller\spec.iss


    Add-Content -Path ..\$nameInstaller\spec.iss -Value ($tempIss)

    <#CARGO LOS PLUGINS PARA CONSTRUIR SERVICE.YML Y EL SPEC.ISS#>
    foreach($plg in $plugins){
            $template = "    -`n" + "        name: $($plg.name)`n" + "        jar: $($plg.jar)"
            $source = "Source: "+"..\ext\lib\$($plg.jar)"+"; DestDir: "+"{app}\lib\"+"; Flags: ignoreversion"

            Add-Content ..\$nameInstaller\spec.iss -Value ($source)
            Add-Content .\plane\plugins\$nameInstaller\service.yml -Value ($template)
            Add-Content .\plane\plugins\$nameInstaller\service.yml -Value "        service: $($plg.service)"
    }

    if($genInstaller -eq "true")
        {
        <#Ejecuto proceso de instalacion con innoSetup pasandole como argumento la carpeta correspondiente#>
            $sign = "iSCertHubInstaller"+"$nameInstaller"
            Start-Process  .\build.bat -ArgumentList @($nameInstaller,$sign)
            Write-Host Luego que termine el proceso de generacion del instalador, puede encontrar el ejecutable en la carpeta dist
            Write-Host Corrobore que el ejecutable esta firmado digitalmente haciendo click derecho y accediendo a las propiedades del archivo.
        }
    else{
            <#No genera el instalador (usualmente para modificar el spec.iss)#>
        }
    
}

if($configPath.Length -gt 0){
    function getArg($arrAux,[int]$position){
        $arrRes = [System.Collections.ArrayList]::new()
        while(($arrAux.count -gt $position) -and ($arrAux[$position][0] -ne '-')){
            $aux = $arrRes.add($arrAux[$position])
            $position++
        }
        return $arrRes
    }
    $params = Get-Content $configPath  -Raw

    $params = $params.replace(' ','')
    $params = $params.replace("`r",'')
    $params = $params.replace("`t",'')
    $arrayArgs= $params.Split("`n");
 
    $myarray = [System.Collections.ArrayList]::new()
    $nuevo = [System.Collections.ArrayList]::new()

    foreach ($value in $arrayArgs) {
        if($value.length -gt 0){
            $valor = $nuevo.add($value.Trim())
        }

    }

    
    $arrayArgs = $nuevo
    $nameInstaller
    $plugins = @()
    $arrData = [System.Collections.ArrayList]::new()
    for ($i = 0; $i -lt $arrayArgs.count; $i++)
    {
        switch($arrayArgs[$i]){
            '-nameInstaller' {
                $arrData = getArg $arrayArgs ($i+1)         
                if($arrData.count -gt 0) { 
                   $nameInstaller = $arrData

                }else{
                    throw "Ingrese un valor para nameInstaller"
                } 

            }
            '-plugins'{
               $arrData = getArg $arrayArgs ($i+1)        
               if($arrData.count -gt 0){ 
                    foreach($value in $arrData){
                      $value = $value.replace(';',"`n").replace('@','').replace('{','').replace('}','').replace('"','')
                      $hashTable = ConvertFrom-StringData $value
                      $plugins += ,$hashtable
                    } 
               }else{
                    throw "Ingrese valores para Plugins"
               }
       
            }
            '-genInstaller'{
                $genInstaller = $arrayArgs[$i+1]
            }
        }
    }
 
}
build -nameInstaller $nameInstaller -plugins $plugins -genInstaller $genInstaller
