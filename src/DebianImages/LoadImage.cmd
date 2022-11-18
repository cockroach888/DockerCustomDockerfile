@echo off
@title 自动导入 Debian 基础镜像

set basedir="%~dp0"
set basedir


@echo\&echo ===== 导入 Debian 基础镜像 =====

cd /d "%basedir%\v11.5"

docker load -i debian-11.5.tar.gz
docker load -i debian-11.5-slim.tar.gz



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== 自动导入 Debian 基础镜像完毕。=====
@echo\&echo 请按任意键继续...
pause>nul 
exit