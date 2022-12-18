@echo off
@title Docker 容器清理 - EMQX

set basedir="%~dp0"
set basedir


@echo\&echo ===== 清理 EMQX Docker 镜像（EMQXService）=====

docker rmi emqx/emqx:5.0.12-amd64
docker rmi emqx/emqx:5.0.12-amd64-slim
::docker rmi emqx/emqx:5.0.12-arm64
::docker rmi emqx/emqx:5.0.12-arm64-slim



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== EMQX Docker 容器清理完毕。=====
@echo\&echo 请按任意键继续...
pause>nul 
exit