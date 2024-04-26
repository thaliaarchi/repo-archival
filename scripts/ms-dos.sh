#!/usr/bin/env bash
set -eEuo pipefail

. base.sh

# TODO:
# - Create linear history with the four versions modifying the same directories.
# - Use the Computer History Museum's version of v1.25 and v2.0.
# - Investigate force-pushed commits.
# - Pick either the original or optimized PNG version for the logo. Where were
#   they sourced? The PNGs may have useful text (https://www.w3.org/TR/png-3/#11textinfo),
#   EXIF (https://www.w3.org/TR/png-3/#eXIf), or timestamp (https://www.w3.org/TR/png-3/#11timestampinfo)
#   information.

# https://www.hanselman.com/blog/open-sourcing-dos-4
# https://computerhistory.org/blog/microsoft-ms-dos-early-source-code/
# https://news.ycombinator.com/item?id=40163405
# https://www.os2museum.com/wp/how-not-to-release-historic-source-code/

mkdir ms-dos
cd ms-dos

# The repo was force-pushed to reorganize and remove an insult. Discussed at
# https://news.ycombinator.com/item?id=40163766. Strangely, both of these cooked
# repos have many corrupt packed objects.
clone_swh https://github.com/microsoft/MS-DOS 661305ed4e91e8ab578dcb96ac4816b0f32ece32 ms-dos-1
clone_swh https://github.com/microsoft/MS-DOS 656c98b804c7845b1352a84f08177401caaea866 ms-dos-2

clone_submodule https://github.com/microsoft/MS-DOS ms-dos

cd ms-dos

# 1. Remove translated READMEs. With the addition of MS-DOS v4.0, they became
#    out of date and a5eb02a (Moving localized READMEs, 2024-04-25) moved them
#    to .readmes/, essentially deprecating them. Since the purpose here is to
#    make a linear development history, these feel out of place.
# 2. Pick "src" as the directory name.
# 3. Move icons to docs/
git filter-repo --quiet \
  --invert-paths \
  --path-regex 'README[.-].+\.md' \
  --path-regex .readmes/thanks.md \
  --invert-paths \
  \
  --path-rename v1.25/source/:v1.25/src/ \
  --path-rename v2.0/source/:v2.0/src/ \
  \
  --path-rename msdos-logo.png:docs/msdos-logo.png \
  --path-rename msdos-logo_250x250.png:docs/msdos-logo_250x250.png \
  --path-rename .readmes/:docs/
