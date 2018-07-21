#/bin/bash
for i in {0..100..5}; do psplash-write "PROGRESS $i"; sleep 0.2; done
psplash-write "MSG waiting for network..."
