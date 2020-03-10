@ECHO OFF
REM // delete some intermediate assembler output just in case
IF EXIST main.p del main.p
IF EXIST main.p goto LABLERROR2
IF EXIST main.h del main.h
IF EXIST main.h goto LABLERROR1

REM // run the assembler
set AS_MSGPATH=win32/as
set USEANSI=n

"AMPS/Includer.exe" AS AMPS AMPS/.Data
"win32/as/asw" -xx -q -E -L main.asm

REM // if there were errors, there won't be any main.p output
IF NOT EXIST main.p goto LABLERROR5

REM // combine the assembler output into a rom
"win32/s2p2bin" main.p player.md main.h

REM // if there were errors/warnings, a log file is produced
IF EXIST main.log goto LABLERROR4


REM // done -- pause if we seem to have failed, then exit
IF NOT EXIST player.md pause & exit /b
"ErrorDebugger/ConvSym.exe" main.lst player.md -input as_lst -a
del main.p
del main.h
del AMPS\.Data
exit /b

:LABLERROR1
echo Failed to build because write access to main.h was denied.
pause


exit /b

:LABLERROR2
echo Failed to build because write access to main.p was denied.
pause


exit /b

:LABLERROR3
echo Failed to build because write access to player.md was denied.
pause

exit /b

:LABLERROR4
REM // display a noticeable message
echo.
echo **********************************************************************
echo *                                                                    *
echo *      There were build warnings. See main.log for more details.     *
echo *                                                                    *
echo **********************************************************************
echo.
pause

exit /b

:LABLERROR5
REM // display a noticeable message
echo.
echo **********************************************************************
echo *                                                                    *
echo *       There were build errors. See main.log for more details.      *
echo *                                                                    *
echo **********************************************************************
echo.
pause


