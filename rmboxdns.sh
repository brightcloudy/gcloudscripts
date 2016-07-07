#!/bin/bash
OLDIP=`dig +short "$1"pega.sexy.`
gcloud dns record-sets transaction start --zone=main-pegasexy
gcloud dns record-sets transaction remove --zone=main-pegasexy --name="`echo $1`pega.sexy." --type=A --ttl=180 "$OLDIP"
gcloud dns record-sets transaction execute --zone=main-pegasexy
