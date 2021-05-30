#!/bin/bash
# xset r rate delay_in_ms repetition_during_second
# xset s 600    <- 10 min to activate screensaver 
# xset dpms 1.standby 2.sleep 3.off - all three in seconds
xset r rate 250 100 s 600 600 dpms 36000 36000 36000
