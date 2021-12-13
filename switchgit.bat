@ECHO OFF
SET PN=please set your personal user.name here
SET PM=please set your personal user.email here
SET WPN=please set your workplace user.name here
SET WPM=please set your workplace user.email here


ECHO =======================================
ECHO Your Current Git Name:
git config user.name
ECHO Your Current Git Email:
git config user.email
ECHO =======================================
ECHO Options
ECHO =======================================
ECHO 1.) Personal: %PN%
ECHO 2.) Workplace: %WPN%
ECHO =======================================
SET /P ENV="Choose an option(1 or 2):"

2>NUL CALL :CASE_%ENV%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

ECHO Done.
EXIT /B

:CASE_1
  git config --global user.name "%PN%"
  git config --global user.email "%PM%"
  ECHO =======================================
  ECHO Your have switched to:
  git config user.name
  git config user.email
  ECHO =======================================
  PAUSE
  GOTO END_CASE
:CASE_2
  git config --global user.name "%WPN%"
  git config --global user.email "%WPM%"
  ECHO =======================================
  ECHO Your have switched to:
  git config user.name
  git config user.email
  ECHO =======================================
  PAUSE
  GOTO END_CASE
:DEFAULT_CASE
  ECHO InValid options "%ENV%"
  PAUSE
  GOTO END_CASE
:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL