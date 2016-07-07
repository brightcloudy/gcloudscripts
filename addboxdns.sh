#!/bin/bash
gcloud dns record-sets transaction start --zone=main-pegasexy
gcloud dns record-sets transaction add --zone=main-pegasexy --name="`echo $1`pega.sexy." --type=A --ttl=180 "$2"
gcloud dns record-sets transaction execute --zone=main-pegasexy
