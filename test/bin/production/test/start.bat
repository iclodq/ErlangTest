@echo off
@echo �������ؿ����ڵ�
@echo %username% /time:3 /w "�����������ؿ����ڵ�..."
goto continue        
:continue
set cookie=abc
set nodeName=n1
start E:\tools\erl5.10.3\bin\werl -sname %nodeName% 
exit