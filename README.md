# Oneplus-Update-Script
Script to flash partitions one by one in fastbootd.
___________________________________________________

FIRST OF ALL, THIS IS ALL VERY MUCH AT YOUR OWN RISK! I'M NOT EVEN A SCRIPT KIDDIE, I HAVE NO IDEA WHAT I'M DOING!
___________________________________________________

This one is setup to flash OOS 11.0.7 on N10 BE2026 BE86AA. You can add other firmwares in the "be2026" folder, the script will ask you which firmware (folder) to flash. I'm not sure though that the nordSDK in here works with N10. I use it for my N100. It's necessary since the normal ADB/fastboot doesn't work properly with OnePlus fastbootd. No real configuration should be necessary since this one is preconfigured for the N10, as long as you put the files the correct place. 11.0.7 files are already included the correct place so will work out of the box. You can look through the files to see how it's set up.
___________________________________________________

-Extract files to C:\Android\ 

Filetree should be:

C:\Android\nordSDK\
-------------payload_dumper\
-------------be2026
___________________________________________________

--RUNNING THE SCRIPT:

-Enable USB Debugging.

-Use existing ADB or the one from nordSDK to enter fastbootd with:

"adb reboot bootloader"

"fastboot reboot fastboot"

-Check on phone that is says fastbootd.

-Now run "flash_all.bat" inside nordSDK and the script should guide you through the rest. When it asks to choose a slot, i recommend changing to the inactive one.
