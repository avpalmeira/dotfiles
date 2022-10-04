:: To make them persistent:
:: 1) Run regedit
:: 2) Go to HKEY_CURRENT_USER -> Software -> Microsoft -> Command Processor
:: 3) Add String Value entry with the name AutoRun and the path for this file (aliases.bat)

@echo off

:: Navigation aliases

DOSKEY ..=cd ..
DOSKEY ...=cd ../..
DOSKEY /=cd /
DOSKEY h=cd %USERPROFILE%
DOSKEY dev=cd %USERPROFILE%\source\repos
DOSKEY nd=pushd $*
DOSKEY nd-=popd

:: Text edition

DOSKEY c=clear

:: Show aliases
DOSKEY alias=doskey /MACROS:ALL