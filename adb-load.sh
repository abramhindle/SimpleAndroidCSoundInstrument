adb shell mkdir /sdcard/Csounds
for file in *.csd
do
    adb push $file /sdcard/Csounds
done
