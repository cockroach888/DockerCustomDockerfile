@echo off
@title Docker 容器清理 - TDengine 3.x

set basedir="%~dp0"
set basedir


@echo\&echo ===== 清理 TDengine 3.x Docker 镜像（TDengineService）=====

docker rmi tdengine/tdengine-amd64:3.0.2.1
docker rmi tdengine/tdengine-amd64-slim:3.0.2.1
::docker rmi tdengine/tdengine-aarch64:3.0.2.1
::docker rmi tdengine/tdengine-aarch64-slim:3.0.2.1



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== TDengine 3.x Docker 容器清理完毕。=====
@echo\&echo 请按任意键继续...
pause>nul 
exit