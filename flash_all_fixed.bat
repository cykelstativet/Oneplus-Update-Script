@echo off

	::FIRMWARE PARENT-DIRECTORY
	set directoryRoot=C:\Android\be2026\

::get and echo available firmware
echo Found firmware versions:
echo.[94m
dir %directoryRoot% /a:d /b
echo.[0m

::select firmware
set /p version=Input version number:
set directoryName=%directoryRoot%%version%
echo.

::get and echo current slot
echo Getting current slot...
del getvar 2>nul
%cd%\fastboot getvar current-slot 2>getvar.txt
del newfile 2>nul
del slot.txt 2>nul
cscript /nologo editSlot.vbs  > newfile
ren newfile slot.txt
set /p oldSlot=<slot.txt
set newSlot=%oldSlot%
set currentSlot=%oldSlot%
del slot.txt 2>nul
del getvar 2>nul
del newfile 2>nul
echo.
echo Current slot is [96m%currentSlot%[0m
echo.


::select slot
set /p newSlot=Input prefered slot, [96ma[0m or [96mb[0m (press Enter to keep current):
set currentSlot=%newSlot%
echo.


::ECHO & CONFIRM VARIABLES
echo [95mCurrent firmware directory is [0m[94m%directoryName%[0m
echo [95mFirmware will be installed to [0m[96mslot %newSlot%[0m
echo.
echo Flash files?
pause
echo.
echo Make sure you are in fastbootd
pause
echo.
echo In case of "Invalid sparse file" just wait. Image is resizing in the background.
timeout /t 5
echo.
echo.


::ACTUAL WORK
::choose & change slot
if NOT %oldSlot% == %newSlot% (set currentSlot=%newSlot%
%cd%\fastboot --set-active=%newSlot%
%cd%\fastboot reboot fastboot
%cd%\fastboot reboot fastboot)

::flashing
echo vbmeta
%cd%\fastboot flash vbmeta_%currentSlot% %directoryName%\vbmeta.img
echo.
echo vbmeta_system
%cd%\fastboot flash vbmeta_system_%currentSlot% %directoryName%\vbmeta_system.img
echo.
echo boot
%cd%\fastboot flash boot_%currentSlot% %directoryName%\boot.img
echo.
echo recovery
%cd%\fastboot flash recovery_%currentSlot% %directoryName%\recovery.img
echo.
echo system
%cd%\fastboot flash system_%currentSlot% %directoryName%\system.img
echo.
echo system_ext
%cd%\fastboot flash system_ext_%currentSlot% %directoryName%\system_ext.img
echo.
echo product
%cd%\fastboot flash product_%currentSlot% %directoryName%\product.img
echo.
echo vendor
%cd%\fastboot flash vendor_%currentSlot% %directoryName%\vendor.img
echo.
echo modem
%cd%\fastboot flash modem_%currentSlot% %directoryName%\modem.img
echo.
echo aop
%cd%\fastboot flash abl_%currentSlot% %directoryName%\aop.img
echo.
echo abl
%cd%\fastboot flash abl_%currentSlot% %directoryName%\abl.img
echo.
echo bluetooth
%cd%\fastboot flash bluetooth_%currentSlot% %directoryName%\bluetooth.img
echo.
echo devcfg
%cd%\fastboot flash devcfg_%currentSlot% %directoryName%\devcfg.img
echo.
echo dsp
%cd%\fastboot flash dsp_%currentSlot% %directoryName%\dsp.img
echo.
echo dtbo
%cd%\fastboot flash dtbo_%currentSlot% %directoryName%\dtbo.img
echo.
echo featenabler
%cd%\fastboot flash featenabler_%currentSlot% %directoryName%\featenabler.img
echo.
echo hyp
%cd%\fastboot flash hyp_%currentSlot% %directoryName%\hyp.img
echo.
echo imagefv
%cd%\fastboot flash imagefv_%currentSlot% %directoryName%\imagefv.img
echo.
echo keymaster
%cd%\fastboot flash keymaster_%currentSlot% %directoryName%\keymaster.img
echo.
echo odm
%cd%\fastboot flash keymaster_%currentSlot% %directoryName%\odm.img
echo.
echo odm_stanvbk
%cd%\fastboot flash keymaster_%currentSlot% %directoryName%\odm_stanvbk.img
echo.
echo qupfw
%cd%\fastboot flash qupfw_%currentSlot% %directoryName%\qupfw.img
echo.
echo rpm
%cd%\fastboot flash rpm_%currentSlot% %directoryName%\rpm.img
echo.
echo storsec
%cd%\fastboot flash storsec_%currentSlot% %directoryName%\storsec.img
echo.
echo tz
%cd%\fastboot flash tz_%currentSlot% %directoryName%\tz.img
echo.
echo uefisecapp
%cd%\fastboot flash uefisecapp_%currentSlot% %directoryName%\uefisecapp.img
echo.
echo xbl
%cd%\fastboot flash xbl_%currentSlot% %directoryName%\xbl.img
echo.
echo xbl_config
%cd%\fastboot flash xbl_config_%currentSlot% %directoryName%\xbl_config.img
echo.


::REBOOT PROMPT
echo Press Enter to reboot or Ctrl+C to abort
pause
echo.
echo Press Enter to exit
%cd%\fastboot reboot
pause