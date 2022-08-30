# Oneplus-Update-Script
Script to flash partitions one by one in fastbootd.
___________________________________________________

First of all, this is all very much at your own risk. I'm not even a script kiddie, i have no idea what i'm doing.

Second, i know this looks like a lot of stuff to do, but once it's setup on your PC, it's just extracting payload, entering fastbootd and running the script. You just have to setup the correct directories on your PC the first time. It's a very dumb script which is why i'm writing everything in detailed step-by-step monkey-brain instructions. This way it might actually work.

Much of this setup is due to the script being able to select different firmware versions (if you have several versions stored, like me).

At the end there will be a brief guide on using it when you have already set it up. This is a better representation of how "simple" it is.
___________________________________________________

--FIRST TIME SETUP:
-I recommend creating this directory "C:\Android\" and extracting the firmwareFlashing.zip here. It will make the instructions easier. This should give: C:\Android\nordSDK\, C:\Android\payload_dumper\, C:\Android\phoneModel\.


-Extract payload by placing it in the "payload_input" directory inside "payload_dumper" and then running payload_dumper.exe. I know, it's kinda sketchy running a random .exe from the web and honestly, i haven't checked it for malware. I didn't create it. Did i mention this is all at your own risk?


-Rename "phoneModel" to model number of your phone (Mine is "be2013"). No spaces in directory name.

-In this directory, rename "firmwareVersion" to your firmware version (f.x. "11.0.6"). Again, no spaces.

-Move all .img files from "payload_output" to firmware version directory you just created.

-(Optional) Patch boot.img in magisk. Rename patched boot image to "boot.img" and move it back to firmware directory, overriding the stock image.

-Go into the folder called "nordSDK". This is a modified ADB that works with fastbootd (different from fastboot) on Nord devices. Again, i just got this on the web so not sure which devices it works for. It works for my Nord N100, not sure if N10 works...

-Right-click "flash_all.bat" and click "Edit".

-Under ::FIRMWARE PARENT-DIRECTORY you have to change the directory so it's the same as your model. Then save.

-This should be all, HOWEVER, i can't know if the partitons from my phone are the same as yours. So you have to scroll through the script and check that the partitons in this script (under ::flashing) are the same as the ones you now have extracted to your firmware version folder. If any of your partitions are missing from the script you will have to copy/paste new lines in the script and change the image names to those you have.

-I think that's it??

-In theory, if this is all setup correctly, you should just have to enter fastbootd and run the script:


--RUNNING THE SCRIPT:
-Use existing ADB or the one from nordSDK to enter fastbootd with:
"adb reboot bootloader"
"fastboot reboot fastboot"

-Check on phone that is says fastbootd.

-Now run "flash_all.bat" and the script should guide you through the rest.
