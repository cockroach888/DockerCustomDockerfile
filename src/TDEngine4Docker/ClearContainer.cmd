@echo off
@title Docker �������� - TDengine 3.x

set basedir="%~dp0"
set basedir


@echo\&echo ===== ���� TDengine 3.x Docker ������TDengineService��=====

docker stop TDengineService
docker rm -v TDengineService



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== TDengine 3.x Docker ����������ϡ�=====
@echo\&echo �밴���������...
pause>nul 
exit