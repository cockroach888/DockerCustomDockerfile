@echo off
@title Docker 容器清理 - TDengine 3.x

set basedir="%~dp0"
set basedir


@echo\&echo ===== 清理 TDengine 3.x Docker 容器（TDengineService）=====

docker stop TDengineService
docker rm -v TDengineService



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== TDengine 3.x Docker 容器清理完毕。=====
@echo\&echo 请按任意键继续...
pause>nul 
exit