#!/bin/bash
GDNSNEW=`curl -4 ifconfig.co`
gcloud dns record-sets transaction start --zone=main-pegasexy
gcloud dns record-sets transaction add --zone=main-pegasexy --name="`hostname`.is.pega.sexy." --type=A --ttl=180 "$GDNSNEW"
gcloud dns record-sets transaction execute --zone=main-pegasexy
