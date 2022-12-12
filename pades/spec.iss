#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerPADES

[Files]
Source: "..\ext\lib\plugin.pades.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion