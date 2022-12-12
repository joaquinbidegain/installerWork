#include "..\common\core.iss"
#include "..\common\cert\isa.iss"
#include "..\common\arch\x64.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerTuId
ArchitecturesAllowed=x64
; Because Dermalog needs it.
AlwaysRestart=True

[Files]
Source: "..\ext\lib\plugin.tuid-fingerprint.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.pdf-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion

; Redistributables
Source: "..\ext\redist\dermalog\x64\*"; DestDir: "{tmp}\"; 

[Run]
Filename: "msiexec.exe"; StatusMsg: "Instalando driver de lector";  Parameters: " /i ""{tmp}\DermalogSDK.msi"" /quiet /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; StatusMsg: "Instalando decodificador del lector";  Parameters: " /i ""{tmp}\DermalogFingerCode3.msi"" /quiet /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; StatusMsg: "Instalando plugin de codificación ISO";  Parameters: " /i ""{tmp}\DermalogFormatConversionCBEFF.msi"" /quiet /norestart"; Flags: waituntilterminated
                                 
