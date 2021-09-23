# Pi-DailyMobile
Project on Raspberry Pi that handles Daily mobile logins



# Installing Dependencies
`sudo apt-get update`
`sudo apt-get install -y android-tools-adb android-tools-fastboot`


# Setting up dailies via crontab
`crontab -e`

setup reboot code
`@reboot bash /home/pi/adbreboot.sh`
setup main code
`1 8 * * * bash /home/pi/adbmain.sh`

