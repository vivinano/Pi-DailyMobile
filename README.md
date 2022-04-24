# Pi-DailyMobile
Project on Raspberry Pi that handles Daily mobile logins

* This can work for any linux its a project I made on the PI so I can leave it and forget about it 
* This project has does require some set up to work for your personal use case *
* Example of opening AFK arena is shown in adbmain.sh 


# Requirements

Anrdoird Phone/s - Just Plug in the Pi and GO

Raspberry PI 3/4 - Optional as you can also run on Linux

# Installing Dependencies
`sudo apt-get update`

`sudo apt-get install -y android-tools-adb android-tools-fastboot`


# Setting up dailies via crontab
`crontab -e`

setup reboot code in crontab

`@reboot /bin/bash /home/pi/adbreboot.sh`

setup main code in crontab

`1 8 * * * /bin/bash /home/pi/adbmain.sh`

# Getting App Name

`adb shell pm list packages`

# Determine App X , Y for Touch

`adb shell getevent -l`  when code is run tap your phone and get the values displayed `ABS_MT_POSITION_X` & `ABS_MT_POSITION_Y`

![image](https://user-images.githubusercontent.com/33008397/134714000-d204ae06-4ee1-4f67-a9b9-e48bed180c8b.png)



# Example of Project
![image](https://user-images.githubusercontent.com/33008397/134712377-98e4640e-61cc-4731-a6cc-0b4917e2fead.png)

