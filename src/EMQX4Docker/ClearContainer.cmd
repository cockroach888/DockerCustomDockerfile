@echo off
@title Docker �������� - EMQX

set basedir="%~dp0"
set basedir


@echo\&echo ===== ���� EMQX Docker ������EMQXService��=====

docker stop EMQXService
docker rm -v EMQXService



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== EMQX Docker ����������ϡ�=====
@echo\&echo �밴���������...
pause>nul 
exit