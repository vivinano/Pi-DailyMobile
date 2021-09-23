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

adb shell input keyevent 3 
sleep 5
adb shell input touchscreen swipe 500 800 500 0 200
sleep 5
open_app "com.lilithgame.hgame.gp"
sleep 30
tap_pos "e43" "69e"
sleep 5
close_app "com.lilithgame.hgame.gp"
