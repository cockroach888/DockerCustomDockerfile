@echo off
@title �Զ����� Debian ��������

set basedir="%~dp0"
set basedir


@echo\&echo ===== ���� Debian �������� =====

cd /d "%basedir%\v12.1"

docker load -i debian-12.1.tar.gz
docker load -i debian-12.1-slim.tar.gz



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== �Զ����� Debian ����������ϡ�=====
@echo\&echo �밴���������...
pause>nul 
exit