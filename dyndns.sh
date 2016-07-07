#!/bin/bash
GDNSPREV=`gcloud dns record-sets list --zone=main-pegasexy | grep "`hostname`.is.pega.sexy." | sed 's/^.*180\s*\([0-9.]*\)$/\1/'`
GDNSNEW=`curl -4 ifconfig.co`
if [ "$GDNSPREV" = "$GDNSNEW" ]
then exit 0
fi
gcloud dns record-sets transaction start --zone=main-pegasexy
gcloud dns record-sets transaction remove --zone=main-pegasexy --name="`hostname`.is.pega.sexy." --type=A --ttl=180 "$GDNSPREV"
gcloud dns record-sets transaction add --zone=main-pegasexy --name="`hostname`.is.pega.sexy." --type=A --ttl=180 "$GDNSNEW"
gcloud dns record-sets transaction execute --zone=main-pegasexy
