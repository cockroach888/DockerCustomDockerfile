@echo off
@title �Զ����� Debian ��������

set basedir="%~dp0"
set basedir


@echo\&echo ===== ���� Debian �������� =====

cd /d "%basedir%\v11.5"

docker load -i debian-11.5.tar.gz
docker load -i debian-11.5-slim.tar.gz



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== �Զ����� Debian ����������ϡ�=====
@echo\&echo �밴���������...
pause>nul 
exit