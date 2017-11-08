#!/usr/bin/env bash
mkdir -p build
rm -rf build/*
# rivers and lakes
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -B 0 \
    -z 7 \
    --no-tile-stats \
    --layer=provinces_label \
    --output=/build/10m_lakes.mbtiles \
    /data/10m_lakes.geojson
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -B 0 \
    -z 7 \
    --no-tile-stats \
    --layer=provinces_label \
    --output=/build/10m_rivers.mbtiles \
    /data/10m_rivers_lake_centerlines.geojson
# provinces
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -z 7 \
    --no-tile-stats \
    --layer=provinces \
    --output=/build/provinces.mbtiles \
    /data/provinces.geojson
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -B 0 \
    -z 7 \
    --no-tile-stats \
    --layer=provinces_label \
    --output=/build/provinces_label.mbtiles \
    /data/provinces_label.geojson
# fortifications
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -Z 6 \
    -z 11 \
    --no-tile-stats \
    --layer=fortifications \
    --output=/build/fortifications.mbtiles \
    /data/fortifications.geojson
# roads
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -Z 0 \
    -z 11 \
    --no-tile-stats \
    --layer=roads \
    --output=/build/roads_low.mbtiles \
    /data/roads_low.geojson
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -Z 10 \
    -z 11 \
    --no-tile-stats \
    --layer=roads \
    --output=/build/roads_high.mbtiles \
    /data/roads_high.geojson
# places
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -B 0 \
    -Z 0 \
    -z 11 \
    --no-tile-stats \
    --layer=places \
    --output=/build/places_low.mbtiles \
    /data/places_low.geojson
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -B 6 \
    -Z 6 \
    -z 11 \
    --no-tile-stats \
    --layer=places \
    --output=/build/places_medium.mbtiles \
    /data/places_medium.geojson
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tippecanoe \
    -B 9 \
    -Z 9 \
    -z 11 \
    --no-tile-stats \
    --layer=places \
    --output=/build/places_high.mbtiles \
    /data/places_high.geojson

# Roman Empire
docker run -it --rm -v $(pwd)/data:/data -v $(pwd)/build:/build \
    klokantech/tippecanoe tile-join \
    -n "Roman Empire" \
    -f \
    --no-tile-stats \
    -o /build/roman-empire.mbtiles \
    /build/roads_low.mbtiles \
    /build/roads_high.mbtiles \
    /build/places_low.mbtiles \
    /build/places_medium.mbtiles \
    /build/places_high.mbtiles \
    /build/fortifications.mbtiles \
    /build/provinces.mbtiles \
    /build/provinces_label.mbtiles \ 
    /build/10m_lakes.mbtiles \
    /build/10m_rivers.mbtiles

cd build
find . -name '*.mbtiles' ! -name 'roman-empire.mbtiles' -type f -exec rm -f {} +
./../mbutil/mb-util --image_format=pbf --silent roman-empire.mbtiles roman-empire
cd roman-empire
gzip -d -r -S .pbf *
find . -type f ! -name 'metadata.json' -exec mv '{}' '{}'.pbf \;
cd ../..
