@echo off
@title 自动导入 Debian 基础镜像

set basedir="%~dp0"
set basedir


@echo\&echo ===== 导入 Debian 基础镜像 =====

cd /d "%basedir%\v12.1"

docker load -i debian-12.1.tar.gz
docker load -i debian-12.1-slim.tar.gz



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== 自动导入 Debian 基础镜像完毕。=====
@echo\&echo 请按任意键继续...
pause>nul 
exit