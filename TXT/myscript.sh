#! /bin/bash

sha="SHA256SUM"
files="my*.txt my*.sh"

echo "Remove SHA files"
rm -f $sha $sha.asc

echo "Make SHA256SUM of files"
sha256sum $files > $sha

echo "Verify files have not change"
sha256sum -c $sha

echo "Make a detached signature for the SHA256SUM file in SHA256SUM.asc"
gpg --output $sha.asc --armor --sign --detach-sign $sha

echo "Verify SHA256SUM integrity with SHA256SUM.asc signature"
gpg --verify $sha.asc $sha

exit 0
