#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerSAP

[Files]
Source: "..\ext\lib\plugin.pdf-sign.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion