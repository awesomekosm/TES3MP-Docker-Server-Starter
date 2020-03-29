#!/bin/bash

set -e

_TES_SERVER_HOST="c:/opt/tes-server"

mkdir -p "$_TES_SERVER_HOST"

cp -r data $_TES_SERVER_HOST
cp tes3mp-server-default.cfg $_TES_SERVER_HOST

echo "Building tes-server image..."
docker build --tag local/tes-server .

echo "Removing existing tes-server container..."
docker rm -f tes-server || true

echo "Starting new tes-server container..."
docker run -d --name tes-server \
	-v "$_TES_SERVER_HOST"/data:/opt/TES3MP-server/CoreScripts/data \
	-v "$_TES_SERVER_HOST"/tes3mp-server-default.cfg:/opt/TES3MP-server/tes3mp-server-default.cfg \
	-p 25565:25565/tcp \
	-p 25565:25565/udp local/tes-server

echo "Tailing tes-server container..."
docker logs -f tes-server
