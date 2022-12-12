#include "..\common\base.iss"
#include "..\common\cert\seciu.iss"

[Setup]
OutputBaseFilename=iSCertHubInstallerSECIU
   
[Files]
Source: "..\ext\lib\plugin.pdf-sign.seciu.isc"; DestDir: "{app}\lib\"; DestName: "plugin.pdf-sign.isc"; Flags: ignoreversion
Source: "..\ext\lib\plugin.sign-p7.isc"; DestDir: "{app}\lib\"; Flags: ignoreversion
