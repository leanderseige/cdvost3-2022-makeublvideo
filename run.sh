#!/bin/bash


# get all collections
for i in {1..10}; do wget -P collections/ "https://iiif.ub.uni-leipzig.de/kenom/collections/institution:DE-15/$i.json"; done

# get all manifest URLs
jq -r '.manifests[]."@id"' collections/*.json > manifests.csv

./getmanifests.sh

./getimages.sh > images.csv

./loadimages.sh

./makeframes.sh

./makevideo.sh
