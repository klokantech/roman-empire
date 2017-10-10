#!/usr/bin/env bash
mkdir -p build
rm -rf build/*
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build klokantech/tippecanoe tippecanoe -z 7 --output=/build/provinces.mbtiles /data/provinces.geojson

cd build
./../mbutil/mb-util --image_format=pbf provinces.mbtiles provinces
cd provinces
gzip -d -r -S .pbf *
find . -type f ! -name 'metadata.json' -exec mv '{}' '{}'.pbf \;
cd ../..