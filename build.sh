#!/bin/bash

set -ex

echo "Logging into Docker Registry"
echo $DOCKER_TOKEN | docker login --username arpitjindal1997 --password-stdin

echo "Starting to clone secrets repo"
git clone https://arpitjindal97:$GIT_PAT_TOKEN@github.com/arpitjindal97/secrets.git

mkdir db
cp secrets/myst/myst.db db/
cp secrets/myst/nodeui-pass nodeui-pass

nodeIdentities=($(ls secrets/myst | grep 0x))

for i in "${nodeIdentities[@]}"
do
    tag="${i:2:7}"
    echo "Building Docker Image of $i" with tag "$tag"
    rm -rf keystore 2> /dev/null
    cp -a "secrets/myst/$i/keystore" .
    docker buildx build --platform linux/arm64,linux/amd64 -t arpitjindal1997/myst-multiarch:$tag . --push
    docker buildx build --platform linux/arm64,linux/amd64 -t arpitjindal1997/myst-multiarch:$tag-vpn -f Dockerfile.vpn . --push
done

if rm -r secrets db keystore 2> /dev/null;
then
    echo "SUCCESS"
else
    echo "FAILED"
fi
