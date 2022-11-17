@echo off
set Build="%SYSTEMDRIVE%\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\MsBuild.exe"
if exist publish rd /s /q publish
dotnet build "NETStandard2.0/Afx.Tcp.Protocols/Afx.Tcp.Protocols.csproj" -c Release
dotnet build "NETStandard2.1/Afx.Tcp.Protocols/Afx.Tcp.Protocols.csproj" -c Release
dotnet build "NET6.0/Afx.Tcp.Protocols/Afx.Tcp.Protocols.csproj" -c Release
cd publish
del /q/s *.pdb
del /q/s Afx.Sockets*
del /q/s protobuf-net*
pause