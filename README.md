# Pi-DailyMobile
Project on Raspberry Pi that handles Daily mobile logins

* This can work for any linux its a project I made on the PI so I can leave it and forget about it 
* This project has does require some set up to work for your personal use case *
* Example of opening AFK arena is shown in adbmain.sh 



# Installing Dependencies
`sudo apt-get update`

`sudo apt-get install -y android-tools-adb android-tools-fastboot`


# Setting up dailies via crontab
`crontab -e`

setup reboot code in crontab

`@reboot bash /home/pi/adbreboot.sh`

setup main code in crontab

`1 8 * * * bash /home/pi/adbmain.sh`

![image](https://user-images.githubusercontent.com/33008397/134712377-98e4640e-61cc-4731-a6cc-0b4917e2fead.png)

