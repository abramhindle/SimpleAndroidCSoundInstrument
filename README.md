Android Csound Programs
=======================

By Abram Hindle, and Matthew Skala

You need CSound 6.05 for Android or earlier. I have not tested on 6.06 or 6.07.

For Android 4.2 try:

    http://sourceforge.net/projects/csound/?source=typ_redirect
    http://sourceforge.net/projects/csound/files/csound6/Csound6.05/

The android program:

    http://sourceforge.net/projects/csound/files/csound6/Csound6.05/Csound6.apk/download

For Android 5.0

    Or try google play https://play.google.com/store/apps/details?id=com.csounds.Csound6&hl=en on Android 5.0 devices

adb-load.sh
===========

This program will usd the android debug bridge to load up CSD files 

tones.csd
=========

Tones allows you to set a single oscillator with the default ANdroid Csound UI. This is useful for when you are travelling and you need to produce some sine tones to prove a point.

Slider 1: Volume
Slider 2: Low-end of pitch (0 to 1000hz)
Slider 3: High-end of pitch (0 to 1000hz)
Slider 4: Nothing
Slider 5: Nothing

Button 1: Only the Sine Wave
Button 2: Only the Sinusoidal Ramp Wave
Button 3: Only the Sheppard Tone Wave
Button 4: Only the Square Wave
Button 5: Only the Saw tooth Wave

Trackpad X-Axis: Pitch between low-end and high-end
Trackpad Y-Axis: Nothing

alltones.csd
============

AllTones is just like tones except that the buttons turn on or off 5 different oscillators. AllTones allows you to set a single oscillator with the default ANdroid Csound UI. This is useful for when you are travelling and you need to produce some sine tones to prove a point.

Slider 1: Volume
Slider 2: Low-end of pitch (0 to 1000hz)
Slider 3: High-end of pitch (0 to 1000hz)
Slider 4: Nothing
Slider 5: Nothing

Button 1: Toggle on or off the Sine Wave
Button 2: Toggle on or off the Sinusoidal Ramp Wave
Button 3: Toggle on or off the Sheppard Tone Wave
Button 4: Toggle on or off the Square Wave
Button 5: Toggle on or off the Saw tooth Wave

Trackpad X-Axis: Pitch between low-end and high-end
Trackpad Y-Axis: Nothing

tonepad.csd
===========

Tonepad is just like tones.csd except that it is only triggered by the touch pad and it has an attack and a decay. You can drag around during tonepad to change the tone.

Slider 1: Volume
Slider 2: Low-end of pitch (0 to 1000hz)
Slider 3: High-end of pitch (0 to 1000hz)
Slider 4: Nothing
Slider 5: Nothing

Button 1: Only the Sine Wave
Button 2: Only the Sinusoidal Ramp Wave
Button 3: Only the Sheppard Tone Wave
Button 4: Only the Square Wave
Button 5: Only the Saw tooth Wave

Trackpad X-Axis: Play the tone and set the Pitch between low-end and high-end
Trackpad Y-Axis: Nothing


alltonepad.csd
===========

AllTonepad is just like tonepad except that it allows all voices to play in unison.

Slider 1: Volume
Slider 2: Low-end of pitch (0 to 1000hz)
Slider 3: High-end of pitch (0 to 1000hz)
Slider 4: Nothing
Slider 5: Nothing

Button 1: Toggle on or off the Sine Wave
Button 2: Toggle on or off the Sinusoidal Ramp Wave
Button 3: Toggle on or off the Sheppard Tone Wave
Button 4: Toggle on or off the Square Wave
Button 5: Toggle on or off the Saw tooth Wave

Trackpad X-Axis: Play the tone and set the Pitch between low-end and high-end
Trackpad Y-Axis: Nothing

ch-improv-android.csd
=====================

This is a mix of Matthew Skala's sheppard tones composition and some android/csound instruments made by Abram. It triggers instruments -- some of which can be further modified by smushing the trackpad.


Slider 1: Frequency 20 to 1000
Slider 2: Amplitude 0 to 4X
Slider 3: High-end of pitch (0 to 1000hz)
Slider 4: Nothing
Slider 5: Nothing

Button 1: Choose Squarewave with sawtooth wave drag-able instrument
Button 2: Choose Sheppardtone with sawtooth wave drag-able instrument
Button 3: Choose loud fog instrument (granular synthesis) drag-able instrument
Button 4: Nothing
Button 5: FM Synthesis instrument - very loud and crazy

Trackpad X-Axis: Play the tone and set the Pitch between low-end and high-end
Trackpad Y-Axis: Pitch Shift
