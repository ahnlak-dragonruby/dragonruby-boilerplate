@ECHO OFF
REM # This script will copy the runtime DragonRuby files from the provided folder; 
REM # this is done so that you can easily switch between DragonRuby versions without
REM # emperiling your project!

REM # Copyright (c) 2020 Pete Favelle <dragonruby@ahnlak.com>
REM # This script is released under the MIT License, see LICENSE for details.

REM # Try and make sure we're running where we expect to be. There are limits to
REM # what you can do here, so we'll just make sure we have a mygame folder
IF NOT EXIST mygame\ (
  ECHO No mygame folder detected - please run this script from your project root
  EXIT /B
)

REM # Also make sure we've been given a folder to copy from
IF "%~1" == "" (
  ECHO usage: copy-dr.bat DragonRuby Folder
  EXIT /B
)
IF NOT EXIST "%~1"\ (
  ECHO DragonRuby folder "%~1" does not exist
  EXIT /B
)

REM # Final check, that there is actually some DragonRuby there!
IF NOT EXIST "%~1"\.dragonruby\ (
  ECHO DragonRuby fold "%~1" does not appear to contain DragonRuby!
  EXIT /B
)

REM # Excellent; we can proceed. Nuke the .dragonruby directory, and copy the fresh one
IF EXIST .dragonruby\ RMDIR /S /Q .dragonruby
XCOPY  /S /E "%~1"\.dragonruby .dragonruby\

REM # And work through the individual files, too
FOR %%F IN (dragonruby.exe dragonruby-bind.exe dragonruby-httpd.exe dragonruby-publish.exe open-source-licenses.txt) DO (
  REM # Remove it if it's here already
  IF EXIST %%F DEL /Q %%F

  REM # And copy it anew, if it's there
  IF EXIST "%~1"\%%F COPY "%~1"\%%F
)

REM done
