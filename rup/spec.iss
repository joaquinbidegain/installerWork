#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerRUP

[Files]
Source: "..\ext\lib\plugin.wacom.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion  
Source: "..\ext\lib\plugin.pdf-print.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion