@echo off
pushd ..\..
call Tools\Premake\Windows\premake5.exe vs2019
popd
PAUSE