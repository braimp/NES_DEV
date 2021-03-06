@ECHO off

REM ***************************************************************************
REM *    This is batch file script to assemble input file and                 *
REM *    create binary output file.                                           *
REM *                                                                         *
REM *    DATE      : 2014/03/24 Monday                                        *
REM *    ASSEMBLER : DASM.exe                                                 *
REM ***************************************************************************

REM Change only file name
SET FILE_NAME=sub16

REM Assembler path
SET ASM_PATH="C:\Documents and Settings\Delta\My Documents\ARM\DOCS\dasm32\DASM.exe"

REM Relative address path
REM SET ASM_PATH=..\..\..\dasm32\DASM.exe

REM Assembler options
SET ASM_OPTIONS= -f3 -o%FILE_NAME%.bin

REM Source path
SET SOURCE_PATH= %FILE_NAME%.asm

REM del /q %SOURCE_PATH%

REM Check input file exists or not?
REM If not exists, then create a template source for lazy developer! :D
if not exist %SOURCE_PATH% (
echo ; ******************************************************> %SOURCE_PATH%
echo ; This file genrated at : %date% %time%>>  %SOURCE_PATH%
echo ; >> %SOURCE_PATH%
echo ; Assembler   : DASM.exe>> %SOURCE_PATH%
echo ; File name   : %FILE_NAME%.asm>> %SOURCE_PATH%
echo ; Description :>> %SOURCE_PATH%
echo ; >> %SOURCE_PATH%
echo ; ******************************************************>> %SOURCE_PATH%
echo.>> %SOURCE_PATH%

echo 	PROCESSOR 6502>> %SOURCE_PATH%
echo 	ORG $8000>> %SOURCE_PATH%
echo.>> %SOURCE_PATH%

echo ; Main entry point of program.>> %SOURCE_PATH%
echo RESET>> %SOURCE_PATH%
echo ; TODO: Write your code here!>> %SOURCE_PATH%
echo.>> %SOURCE_PATH%

echo LOOP_FOR_EVER>> %SOURCE_PATH%
echo 	jmp LOOP_FOR_EVER					; End of program>> %SOURCE_PATH%
echo.>> %SOURCE_PATH%

echo ; Interrupt routines>> %SOURCE_PATH%
echo ; Do nothing just for now!>> %SOURCE_PATH%
echo NMI_ROUTINE>> %SOURCE_PATH%
echo IRQ_ROUTINE>> %SOURCE_PATH%
echo 	rti>> %SOURCE_PATH%
echo.>> %SOURCE_PATH%

echo ; Vector table>> %SOURCE_PATH%
echo 	ORG $FFFA>> %SOURCE_PATH%
echo 	dc.w NMI_ROUTINE>> %SOURCE_PATH%
echo 	dc.w RESET>> %SOURCE_PATH%
echo 	dc.w IRQ_ROUTINE>> %SOURCE_PATH%
)

REM Assemble code
SET EXET_ASM=%ASM_PATH%%SOURCE_PATH%%ASM_OPTIONS%

REM Delete already assembled file
del /q %FILE_NAME%.bin

REM Execute assembler and cereate new binary output file
REM ECHO %EXET_ASM%
%EXET_ASM%

REM Print last executed command exit status.
REM ECHO %?%

REM Pause for viewing output of assembler.
pause