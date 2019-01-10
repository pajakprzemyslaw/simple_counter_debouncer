@echo off
set xv_path=C:\\xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 49e5f404c5f24de9b672e0e2a129ab70 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot main_behav xil_defaultlib.main -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
