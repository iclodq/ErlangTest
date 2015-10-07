@echo off
@echo 启动本地开发节点
@echo %username% /time:3 /w "正在启动本地开发节点..."
goto continue        
:continue
set cookie=abc
set nodeName=n1
start E:\tools\erl5.10.3\bin\werl -sname %nodeName% 
exit