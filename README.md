# Oneplus-Update-Script
Of course GitHub has file size limits, so what was even the point of creating this? Anyway, [here's a MEGA link to the zip](https://mega.nz/file/wx4GWIjC#6EL90MSAfmehv2B_qpbQRZ1Z934M6fnaw7EBHtctHQY)
___________________________________________________
Script to flash partitions one by one in fastbootd.
___________________________________________________

FIRST OF ALL, THIS IS ALL VERY MUCH AT YOUR OWN RISK! I'M NOT EVEN A SCRIPT KIDDIE, I HAVE NO IDEA WHAT I'M DOING!
___________________________________________________

This one is setup to flash OOS 11.0.7 on N10 BE2026 BE86AA. You can add other firmwares in the "be2026" folder, the script will ask you which firmware (folder) to flash. I'm not sure though that the nordSDK in here works with N10. I use it for my N100. It's necessary since the normal ADB/fastboot doesn't work properly with OnePlus fastbootd. No real configuration should be necessary since this one is preconfigured for the N10, as long as you put the files the correct place. 11.0.7 files are already included in the correct place so will work out of the box. You can look through the files to see how it's set up.

Boot image is not patched with Magisk. So you'll have to do that.
___________________________________________________

-Put the three folders in the zip inside C:\Android\ 

-Bootloader should be unlocked, of course.

-Also, i fucked up the script. Lol. I uploaded a fixed .bat file here. It's just a directory in the top that needs to be changed.
___________________________________________________

--RUNNING THE SCRIPT:

-Enable USB Debugging.

-Use existing ADB or the one from nordSDK to enter fastbootd with:

"adb reboot bootloader"

"fastboot reboot fastboot"

-Check on phone that is says fastbootd.

-Now run "flash_all.bat" inside nordSDK and the script should guide you through the rest. When it asks to choose a slot, i recommend changing to the inactive one.
