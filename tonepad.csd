<CsoundSynthesizer>
<CsOptions>
;;-+rtaudio=alsa
;;-odac
;; Android
-odac -d -m3
</CsOptions>
<CsInstruments>

/*
 * "Chord Improvisation" as posted to Soundcloud January 6 2014 by matthew skala
 * Gutted and android-ified by Abram Hindle 2016
 */

sr = 44100
ksmps = 32
nchnls = 1
0dbfs  = 1

/***** ANDROID ******/

gkslider1 init 0
gkslider2 init 0
gkslider3 init 0
gkslider4 init 0
gkslider5 init 0
gkbutt1 init 0
gkbutt2 init 0
gkbutt3 init 0
gkbutt4 init 0
gkbutt5 init 0
gktrackpadx init 0
gktrackpady init 0
gklasttrackpadx init 0
gklasttrackpady init 0
gkaccelerometerx init 0
gkaccelerometery init 0
gkaccelerometerz init 0

alwayson "Controls"

       instr Controls
gkslider1         chnget "slider1"
gkslider2         chnget "slider2"
gkslider3         chnget "slider3"
gkslider4         chnget "slider4"
gkslider5         chnget "slider5"
gkbutt1           chnget "butt1"
gkbutt2           chnget "butt2"
gkbutt3           chnget "butt3"
gkbutt4           chnget "butt4"
gkbutt5           chnget "butt5"
gktrackpadx       chnget "trackpad.x"
gktrackpady       chnget "trackpad.y"
gkaccelerometerx  chnget "accelerometerX"
gkaccelerometery  chnget "accelerometerY"
gkaccelerometerz  chnget "accelerometerZ"
        endin

gkfreq init 1000
gkamp init 1
gkportamp init 1

gkamp1 init 1 ;; control the volume of instr 1
gkamp2 init 0 ;; control the volume of instr 2
gkamp3 init 0 ;; control the volume of instr 3
gkamp4 init 0 ;; control the volume of instr 4
gkamp5 init 0 ;; control the volume of instr 5

/**************************************************************************/

gisintbl = 1
girisetbl = 2
gisheptbl = 3
gisquaretbl = 4
gisawtbl = 5

gkinstr init 1
/**************************************************************************/

/* slider 1 - volume
   slider 2 - low pitch range 0 to 1000
   slider 3 - high pitch range 0 to 1000
*/


alwayson 1
alwayson 2
alwayson 3
alwayson 4
alwayson 5

/* Play Sine */
        instr 1
krange  = (gkslider3 - gkslider2)*gkfreq
kfreq   = gkslider2*gkfreq + gklasttrackpadx*krange
kenv    = gkslider1*gkamp1*gkportamp
a1      oscili kenv,kfreq,gisintbl
        out a1
        endin

        instr 2
krange  = (gkslider3 - gkslider2)*gkfreq
kfreq   = gkslider2*gkfreq + gklasttrackpadx*krange
kenv    = gkslider1*gkamp2*gkportamp
a1      oscili kenv,kfreq,girisetbl
        out a1
        endin

        instr 3
krange  = (gkslider3 - gkslider2)*gkfreq
kfreq   = gkslider2*gkfreq + gklasttrackpadx*krange
kenv    = gkslider1*gkamp3*gkportamp
a1      oscili kenv,kfreq,gisheptbl
        out a1
        endin

        instr 4
krange  = (gkslider3 - gkslider2)*gkfreq
kfreq   = gkslider2*gkfreq + gklasttrackpadx*krange
kenv    = gkslider1*gkamp4*gkportamp
a1      oscili kenv,kfreq,gisquaretbl
        out a1
        endin

        instr 5
krange  = (gkslider3 - gkslider2)*gkfreq
kfreq   = gkslider2*gkfreq + gklasttrackpadx*krange
kenv    = gkslider1*gkamp5*gkportamp
a1      oscili kenv,kfreq,gisawtbl
        out a1
        endin

;; Code from: http://en.flossmanuals.net/csound/f-csound-on-android/

alwayson "VariablesForControls"

        instr VariablesForControls
        if (gktrackpady + gktrackpadx) > 0 then
            gklasttrackpadx = gktrackpadx
            gklasttrackpady = gktrackpady
            gkamp = 1
        else
            gkamp = 0
        endif
gkportamp port gkamp, 0.05 ;; this is a poor man's envelope
kbutt1    trigger gkbutt1, .5, 0
        if kbutt1 > 0 then
           ;; trigger instr 1
           ;;   event "i", 1, 0.01, 5, gkfreq
           gkinstr = 1
           kbutt1 = 0
           gkamp1 = 1
           gkamp2 = 0
           gkamp3 = 0
           gkamp4 = 0
           gkamp5 = 0
        endif
kbutt2    trigger gkbutt2, .5, 0
        if kbutt2 > 0 then
           ;; trigger instr 2
           ;;   event "i", 2, 0.01, 5, gkfreq
           gkinstr = 2
           kbutt2 = 0
           gkamp1 = 0
           gkamp2 = 1
           gkamp3 = 0
           gkamp4 = 0
           gkamp5 = 0
        endif
kbutt3    trigger gkbutt3, .5, 0
        if kbutt3 > 0 then
           ;; trigger instr 3
           ;;   event "i", 3, 0.01, 5, gkfreq
           gkinstr = 3
           kbutt3 = 0
           gkamp1 = 0
           gkamp2 = 0
           gkamp3 = 1
           gkamp4 = 0
           gkamp5 = 0
        endif
kbutt4    trigger gkbutt4, .5, 0
        if kbutt4 > 0 then
           ;; trigger instr 4
           ;;   event "i", 4, 0.01, 5, gkfreq
           gkinstr = 4
           kbutt4 = 0
           gkamp1 = 0
           gkamp2 = 0
           gkamp3 = 0
           gkamp4 = 1
           gkamp5 = 0
        endif
kbutt5    trigger gkbutt5, .5, 0
        if kbutt5 > 0 then
           ;; trigger instr 5
           ;;   event "i", 5, 0.01, 5, gkfreq
           gkinstr = 5
           kbutt5 = 0
           gkamp1 = 0
           gkamp2 = 0
           gkamp3 = 0
           gkamp4 = 0
           gkamp5 = 1
        endif

endin



</CsInstruments>
<CsScore>
; plain old sine wave
f 1 0 4096 10   1

; sinusoidal rise shape for granular synthesis
f 2 0 1024 19   0.5 0.5 270 0.5

; Shepardesque tone:  octaves with exponential dropoff
f 3 0 4096 9    1 1 0        2 [1/2] 0     4 [1/4] 0   8 [1/8] 0  \
               16 [1/16] 0  32 [1/32] 0   64 [1/64] 0

; square wave (rise/fall limited a little)
f 4 0 1024 7   0 10 1 492 1 20 -1 492 -1 10 0

; nice sharp sawtooth
f 5 0 1024 7   -1 1024 1

t 0 80
f 0 33600
</CsScore>
</CsoundSynthesizer>
