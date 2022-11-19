@echo off
@title Docker ÈÝÆ÷ÖØÖÃ - TDengine 3.x

set basedir="%~dp0"
set basedir


@echo\&echo ===== ÖØÖÃ TDengine 3.x Docker ÈÝÆ÷£¨TDengineService£©=====

docker stop TDengineService
docker rm -v TDengineService

docker create --name TDengineService -h TDengineServer -e TAOS_FQDN=TDengineServer --restart=always -p 50100:6030 -p 50101:6041 -v d:\\data\taos3\data:/var/lib/taos -v d:\\data\taos3\log:/var/log/taos -v d:\\data\taos3\taos.cfg:/etc/taos/taos.cfg -v d:\\data\taos3\taosadapter.toml:/etc/taos/taosadapter.toml tdengine/tdengine-amd64-slim:3.0.1.7

docker start TDengineService



@echo.
@echo.
@echo.
@echo.
@echo.
@echo\&echo ===== TDengine 3.x Docker ÈÝÆ÷ÖØÖÃÍê±Ï¡£=====
@echo\&echo Çë°´ÈÎÒâ¼ü¼ÌÐø...
pause>nul 
exit