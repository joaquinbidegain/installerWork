#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerP7Legacy

[Files]
Source: "..\ext\lib\plugin.sign-p7.bc.dep.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion