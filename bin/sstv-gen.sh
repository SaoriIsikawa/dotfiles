#!/bin/bash
cp -f ./backup/*640x496*.png .
for filename in *.png
  do convert -fill yellow -background '#00000000' \
  -gravity North -size 640x100  \
  -font "Cascadia-Mono-SemiBold" \
  caption:'CQ SSTV    de BG7XTQ' $filename \
  +swap -gravity north -composite $filename
done
# -font "Noto-Sans-Mono-SemiBold" \
# -font "Source-Code-Pro-Semibold" \
# -font "Cascadia-Mono-SemiBold" \

rm -f *.wav
for filename in *.png
  do pisstv -r 44100 -p pd120 $filename
done
# do pisstv -r 44100 -p pd120 $filename
# do /usr/local/bin/sstv-encode pd290 $filename $filename.wav 44100

sox -n -r 44100 -c 1 /tmp/silence-5s.wav trim 0.0 5
sox $(for f in *.wav; do echo -n "$f /tmp/silence-5s.wav "; done) output.wav

