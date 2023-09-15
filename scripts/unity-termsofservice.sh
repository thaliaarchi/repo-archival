#!/bin/bash -e

. base.sh

# $ curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:28fdae008c61d98d0d9ec55b8cc016ce61809f58/
tar xf ../swh/github.com/Unity-Technologies/TermsOfService/swh_1_rev_28fdae008c61d98d0d9ec55b8cc016ce61809f58.git.tar
git clone -q swh:1:rev:28fdae008c61d98d0d9ec55b8cc016ce61809f58.git unity-termsofservice
rm -rf swh:1:rev:28fdae008c61d98d0d9ec55b8cc016ce61809f58.git

cd unity-termsofservice
git remote set-url origin https://github.com/thaliaarchi/unity-termsofservice
