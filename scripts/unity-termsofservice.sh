#!/bin/bash -e

. base.sh

clone_swh https://github.com/Unity-Technologies/TermsOfService 28fdae008c61d98d0d9ec55b8cc016ce61809f58 unity-termsofservice
cd unity-termsofservice
git remote set-url origin https://github.com/thaliaarchi/unity-termsofservice
