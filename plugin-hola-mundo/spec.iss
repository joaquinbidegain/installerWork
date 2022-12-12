#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstaller_HolaMundoPlugin
   
[Files]
Source: "..\ext\lib\plugin.plugin-hola-mundo.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
