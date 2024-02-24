#!/bin/sh

GITHUB_BASE_URL="https://github.com"
_REPO="gabrielecanepa/lewagon"

subpath=$1
folder=$(basename "$subpath")
tmp="$HOME/._"

[ -z "$subpath" ] && echo "Error: no path provided" && exit 1

echo "Downloading $folder..."

git clone "$GITHUB_BASE_URL/$_REPO.git" "$tmp" > /dev/null 2>&1

[ "$?" -ne 0 ] && echo "Error: repository not found" && exit 1
[ -z "$(ls -A "$tmp/$subpath")" ] && echo "Error: path not found" && rm -rf "$tmp" && exit 1
[ -d "$folder" ] && echo "Error: folder already exists" && rm -rf "$tmp" && exit 1

echo "Copying files..."

cp -r "$tmp/$subpath" .
rm -rf "$tmp"

echo "Done! $folder is ready to use."
