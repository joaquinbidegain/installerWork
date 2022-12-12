#include "..\common\base.iss"
#include "..\common\cert\isa.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerTemplate
   
[Files]
Source: "..\ext\lib\plugin.template.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
