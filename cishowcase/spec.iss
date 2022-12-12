#include "..\common\core.iss"
#include "..\common\cert\isa.iss"
#include "..\common\arch\x64.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerCIShowcase
ArchitecturesAllowed=x64
; Because Dermalog needs it.
AlwaysRestart=True

[Files]   
Source: "..\ext\lib\plugin.apdu.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.pdf-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion

; Redistributables
Source: "..\ext\redist\dermalog\x64\*"; DestDir: "{tmp}\"; 

[Run]
Filename: "msiexec.exe"; StatusMsg: "Instalando driver de lector";  Parameters: " /i ""{tmp}\DermalogSDK.msi"" /quiet /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; StatusMsg: "Instalando decodificador del lector";  Parameters: " /i ""{tmp}\DermalogFingerCode3.msi"" /quiet /norestart"; Flags: waituntilterminated
Filename: "msiexec.exe"; StatusMsg: "Instalando plugin de codificación ISO";  Parameters: " /i ""{tmp}\DermalogFormatConversionCBEFF.msi"" /quiet /norestart"; Flags: waituntilterminated
                                 

[Registry]
Root: HKCR; Subkey: "killchrome"; ValueType: string; ValueName: ; ValueData: "URL:kill"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "killchrome"; ValueType: string; ValueName: "URL Protocol"; ValueData: ; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "killchrome\shell"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "killchrome\shell\open"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "killchrome\shell\open\command"; Flags: createvalueifdoesntexist uninsdeletekey  
Root: HKCR; Subkey: "killchrome\shell\open\command"; ValueType: string; ValueName: ; ValueData: "{app}\scripts\kill-chrome.bat"; Flags: createvalueifdoesntexist uninsdeletekey
