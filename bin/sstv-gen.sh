#!/bin/bash
cp -f ./backup/*.png .
for filename in *.png
  do convert -fill white -background '#00000080' \
  -gravity North -size 640x80 \
  -font "Noto-Sans-Mono-SemiBold" \
  caption:'CQ SSTV    de BG7XTQ' $filename \
  +swap -gravity north -composite $filename
done
# -font "Noto-Sans-Mono-SemiBold" \
# -font "Source-Code-Pro-Semibold" \

rm -f *.wav
for filename in *.png
   do pisstv -r 22050 -p pd120 $filename
done

sox -n -r 22050 -c 1 -b 16 /tmp/silence-5s.wav trim 0.0 5
sox $(for f in *.wav; do echo -n "$f /tmp/silence-5s.wav "; done) output.wav

