COPY "plane\plugins\%1\*.yml" "plane\"
CALL enc.bat
cd ..\%1\
iscc spec.iss
cd..\ext\
signtool sign /v /f bin\cert.p12 /p isa.123 /fd SHA256 ^ dist/%2.exe
pause