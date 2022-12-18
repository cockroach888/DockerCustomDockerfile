@echo off
@title Docker �������� - EMQX

set basedir="%~dp0"
set basedir


@echo\&echo ===== ���� EMQX Docker ������EMQXService��=====

docker stop EMQXService
docker rm -v EMQXService

docker create --name EMQXService -h EMQXServer -e EMQX_NAME=EMQXService -e EMQX_HOST=EMQXServer --restart=always -p 10150:1883 -p 10151:18083 -v d:\\data\emqx\data:/var/lib/emqx/data -v d:\\data\emqx\log:/var/log/emqx -v d:\\data\emqx\etc:/etc/emqx emqx/emqx:5.0.12-amd64-slim

docker start EMQXService



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== EMQX Docker ����������ϡ�=====
@echo\&echo �밴���������...
pause>nul 
exit