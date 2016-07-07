#!/bin/bash
gcloud dns record-sets transaction start --zone=main-pegasexy
gcloud dns record-sets transaction add --zone=main-pegasexy --name="$1" --type=MX --ttl=180 "1 ASPMX.L.GOOGLE.COM." "5 ALT1.ASPMX.L.GOOGLE.COM." "5 ALT2.ASPMX.L.GOOGLE.COM." "10 ASPMX2.GOOGLEMAIL.COM." "10 ASPMX3.GOOGLEMAIL.COM."
gcloud dns record-sets transaction execute --zone=main-pegasexy 
