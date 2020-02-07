@echo off
echo %1

set make=%~dpnx0
set EXE=AppName.exe

if [%1]==[build] goto :BUILD
if [%1]==[install] goto :INSTALL
if [%1]==[uninstall] goto :UNINSTALL
if [%1]==[clean] goto :CLEAN
goto :ALL

:ALL
	goto :BUILD
goto :DONE

:BUILD
	mkdir build
	cd src
	go build -o ..\build\%EXE%
	cd ..
goto :DONE

:CLEAN
	rm -rf build
goto :DONE

:INSTALL
	%make% build && cp build\%EXE% %GOROOT%\bin && %make% clean
goto :DONE

:UNINSTALL
	rm %GOROOT%\bin\%EXE%
goto :DONE

:DONE
	echo done.
