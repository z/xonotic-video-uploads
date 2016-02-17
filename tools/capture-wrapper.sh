#!/bin/bash
# Used to exit Xonotic after the capture is complete
DISPLAY=:1.0
( ./all run -userdir ~/.xonotic +playdemo demos/capture-4.dem & ) | grep -q "Finishing capture"
# Alternative
#grep -m 1 "Finishing capture" <(./all run -userdir ../../../.xonotic +playdemo demos/capture-4.dem)
