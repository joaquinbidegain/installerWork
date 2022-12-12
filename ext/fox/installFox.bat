cd %~dp0
for /D %%j in ("%USERPROFILE%\..\*") do for /D %%i in ("%%j\AppData\Roaming\Mozilla\Firefox\Profiles\*") do .\foxutil -A -n ISA -t "C,C,C" -f %1 -i .\ca_isa.crt -d "sql:%%i"
for /D %%j in ("%USERPROFILE%\..\*") do for /D %%i in ("%%j\AppData\Roaming\Mozilla\Firefox\Profiles\*") do .\foxutil -A -n 127.0.0.1 -t "P,P,P" -i .\ssl_app.crt -d "sql:%%i"
for /D %%j in ("%USERPROFILE%\..\*") do for /D %%i in ("%%j\AppData\Roaming\Mozilla\Firefox\Profiles\*") do .\foxutil -A -n ISA -t "C,C,C" -f %1 -i .\ca_isa.crt -d "%%i"
for /D %%j in ("%USERPROFILE%\..\*") do for /D %%i in ("%%j\AppData\Roaming\Mozilla\Firefox\Profiles\*") do .\foxutil -A -n 127.0.0.1 -t "P,P,P" -i .\ssl_app.crt -d "%%i"