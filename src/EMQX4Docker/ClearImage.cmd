@echo off
@title Docker �������� - EMQX

set basedir="%~dp0"
set basedir


@echo\&echo ===== ���� EMQX Docker ����EMQXService��=====

docker rmi emqx/emqx:5.0.12-amd64
docker rmi emqx/emqx:5.0.12-amd64-slim
::docker rmi emqx/emqx:5.0.12-arm64
::docker rmi emqx/emqx:5.0.12-arm64-slim



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== EMQX Docker ����������ϡ�=====
@echo\&echo �밴���������...
pause>nul 
exit