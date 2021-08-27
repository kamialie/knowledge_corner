#!/bin/bash

ARCHIVE_REPO="repo_archives"

declare -a arr=("url_1" 
				"url_2"
                )

mkdir $ARCHIVE_REPO

for REPO_URL in "${arr[@]}"
do
	REPO_NAME=$(echo "$REPO_URL" | cut -d'/' -f7)
	echo "$REPO_NAME:"

	git clone --mirror "$REPO_URL" "$REPO_NAME"

	cd "$REPO_NAME"
	git bundle create "$REPO_NAME".bundle --all
	echo "$REPO_NAME - bundled!"

	mv "$REPO_NAME".bundle ../$ARCHIVE_REPO
	cd ..
	rm -rf "$REPO_NAME"
	echo "$REPO_NAME - moved!"
done
