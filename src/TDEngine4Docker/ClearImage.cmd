@echo off
@title Docker �������� - TDengine 3.x

set basedir="%~dp0"
set basedir


@echo\&echo ===== ���� TDengine 3.x Docker ����TDengineService��=====

docker rmi tdengine/tdengine-amd64:3.0.2.1
docker rmi tdengine/tdengine-amd64-slim:3.0.2.1
::docker rmi tdengine/tdengine-aarch64:3.0.2.1
::docker rmi tdengine/tdengine-aarch64-slim:3.0.2.1



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== TDengine 3.x Docker ����������ϡ�=====
@echo\&echo �밴���������...
pause>nul 
exit