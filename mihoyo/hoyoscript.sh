#!/bin/bash
actsize=`adb shell wm size`
actysize=`echo $actsize | cut -d x -f 2`
actxsize=`echo $actsize | cut -d x -f 1 | cut -d " " -f 3`
virsize=`adb shell getevent -p | grep -e 0035 -e 0036`
virxsize=`echo $virsize | grep -e 0035 |cut -d , -f 3 | cut -d " " -f 3`
virysize=`echo $virsize | grep -e 0036 |cut -d , -f 3 | cut -d " " -f 3`
xrat=`echo "$actxsize / $virxsize" | bc -l`
yrat=`echo "$actysize / $virysize" | bc -l`
function get_tap {
 hex2dec=$((16#$1))
 truetap=`echo "$hex2dec * $2" | bc -l`
 roundtap=`echo $truetap | awk '{print int($1)}'`
 echo $roundtap
}
function open_app {
 adb shell monkey -p $1 -v 1
}
function close_app {
 adb shell am force-stop $1
}
function tap_pos {
 posix=`get_tap $1 $xrat`
 posiy=`get_tap $2 $yrat`
 echo "tapped $posix X and $posiy Y"
 adb shell input tap $posix $posiy
}

# Power on
adb shell input keyevent 3
sleep 5
adb shell input touchscreen swipe 500 800 500 0 200
sleep 5

function hoyogenshin {
open_app "com.mihoyo.hoyolab"
sleep 5
#tap Tools Ico
tap_pos "51a" "fb6"
sleep 8
#tap Genshin Ico
tap_pos "288" "31e"
sleep 5
#tap Sign in
tap_pos "661" "5c9"
sleep 8
#tap 1
tap_pos "33e" "a1b"
sleep 1
tap_pos "66c" "a00"
sleep 1
tap_pos "9bc" "9fb"
sleep 1
tap_pos "ced" "9f6"
sleep 1
tap_pos "2d5" "cb3"
#tap 6
sleep 1
tap_pos "6a5" "c80"
sleep 1
tap_pos "9b9" "cb5"
sleep 1
tap_pos "d9b" "cad"
sleep 1
tap_pos "397" "f3b"
sleep 1
tap_pos "67b" "f15"
#tap 11
sleep 1
tap_pos "992" "efe"
sleep 1
tap_pos "c6d" "f2d"
sleep 3
close_app "com.mihoyo.hoyolab"
}

function hoyohi {
open_app "com.mihoyo.hoyolab"
sleep 5
#tap Tools ico
tap_pos "51a" "fb6"
sleep 5
#tap HI3 ICO
tap_pos "525" "299"
sleep 5
#tap Sign in
tap_pos "661" "5c9"
sleep 8
#tap 1
tap_pos "380" "853"
sleep 1
tap_pos "661" "8cb"
sleep 1
tap_pos "9bc" "889"
sleep 1
tap_pos "cf3" "893"
sleep 1
tap_pos "37a" "b73"
sleep 1
#tap 6
tap_pos "694" "b9d"
sleep 1
tap_pos "981" "b98"
sleep 1
tap_pos "cc8" "bad"
sleep 1
tap_pos "383" "e5d"
sleep 1
tap_pos "5de" "eab"
sleep 1
#tap 11
tap_pos "995" "e68"
sleep 1
tap_pos "cdf" "ea2"
sleep 3
close_app "com.mihoyo.hoyolab"
}

hoyogenshin
sleep 10
hoyohi
