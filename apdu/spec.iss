#include "..\common\base.iss"
#include "..\common\cert\isa.iss"
   
[Setup]
OutputBaseFilename=iSCertHubInstallerAPDU

[Files]
Source: "..\ext\lib\plugin.apdu.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\ext\lib\plugin.pdf-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
