@echo off
pushd ..\..
call Tools\Premake\Windows\premake5.exe vs2022
popd
PAUSE