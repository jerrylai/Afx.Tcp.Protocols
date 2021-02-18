@echo off
set Build="%SYSTEMDRIVE%\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MsBuild.exe"
if exist publish rd /s /q publish
%Build% "NET20/Afx.Tcp.Protocols/Afx.Tcp.Protocols.csproj" /t:Rebuild /p:Configuration=Release
%Build% "NET40/Afx.Tcp.Protocols/Afx.Tcp.Protocols.csproj" /t:Rebuild /p:Configuration=Release
dotnet build "NETStandard2.0/Afx.Tcp.Protocols/Afx.Tcp.Protocols.csproj" -c Release
dotnet build "NETStandard2.1/Afx.Tcp.Protocols/Afx.Tcp.Protocols.csproj" -c Release
cd publish
del /q/s *.pdb
del /q/s Afx.Sockets*
del /q/s protobuf-net*
pause