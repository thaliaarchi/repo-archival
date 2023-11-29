#!/bin/bash -e

. base.sh

mkdir -p minecraft
cd minecraft

# https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://bitbucket.org/cuchaz/minecraft-mappings

# The original Mercurial repo was saved on the SWH:
# https://bitbucket-archive.softwareheritage.org/projects/cu/cuchaz/minecraft-mappings.html

list_swh_branches() {
  local origin="$1"
  curl -s "$(curl -s "https://archive.softwareheritage.org/api/1/origin/$origin/visit/latest/" | jq -r .snapshot_url)" |
  jq -r '
    if .next_branch != null then "has another page of branches" | error end |
    .branches |
    .HEAD.target as $HEAD | del(.HEAD) |
    to_entries[] |
    if .value.target_type != "revision" then "branch is not a revision: \(.)" | error end |
    "\(.key | sub("^branch-tip/"; "")): \(.value.target)\(if $HEAD == .key then " (HEAD)" else "" end)"
  '
}
# list_swh_branches https://bitbucket.org/cuchaz/minecraft-mappings

# Branches:
# default     c8f2db26a26b8fe50626bb1e1c8bfc1d1ff2d78a (HEAD)
# 1.7.10      426f6702449ac9ff8d27a3d009f89af17a186d0b
# 1.8-pre     fbd3c8fcd3446035f443ae5d7305ccce6210924f
# 1.8-pre3    0630c27059316450004a064bc5647bf8b276460d
# 1.8-release c728d234f1a6394e24f78d86f6163295d0f75a0f
# 1.8.3       60c16a80007da504f0c8ab25fde9ecff6579186a
# 1.8.8       ea7159306b376ce6a3c8e83867353326654a6bd3
# 1.9-15w31c  2c1899683c74ff8fb5ef64bacab2d45908b36476
# 1.9-15w32a  a9a6e935b4670f50c0c43bc719e1ca307b3dfbf8

# Request archives:
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:c8f2db26a26b8fe50626bb1e1c8bfc1d1ff2d78a/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:426f6702449ac9ff8d27a3d009f89af17a186d0b/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:fbd3c8fcd3446035f443ae5d7305ccce6210924f/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:0630c27059316450004a064bc5647bf8b276460d/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:c728d234f1a6394e24f78d86f6163295d0f75a0f/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:60c16a80007da504f0c8ab25fde9ecff6579186a/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:ea7159306b376ce6a3c8e83867353326654a6bd3/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:2c1899683c74ff8fb5ef64bacab2d45908b36476/
# curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:a9a6e935b4670f50c0c43bc719e1ca307b3dfbf8/

mkdir cuchaz-mappings
git init -q

for branch in \
  default,c8f2db26a26b8fe50626bb1e1c8bfc1d1ff2d78a \
  1.7.10,426f6702449ac9ff8d27a3d009f89af17a186d0b \
  1.8-pre,fbd3c8fcd3446035f443ae5d7305ccce6210924f \
  1.8-pre3,0630c27059316450004a064bc5647bf8b276460d \
  1.8-release,c728d234f1a6394e24f78d86f6163295d0f75a0f \
  1.8.3,60c16a80007da504f0c8ab25fde9ecff6579186a \
  1.8.8,ea7159306b376ce6a3c8e83867353326654a6bd3 \
  1.9-15w31c,2c1899683c74ff8fb5ef64bacab2d45908b36476 \
  1.9-15w32a,a9a6e935b4670f50c0c43bc719e1ca307b3dfbf8
do
  revision="${branch#*,}"
  branch="${branch%,*}"
  tar xf "$TOPLEVEL/swh/bitbucket.org/cuchaz/minecraft-mappings/swh_1_rev_$revision.git.tar" -C ..
  git remote add new-branch "../swh:1:rev:$revision.git"
  git fetch -q new-branch
  git branch -q "$branch" new-branch/master
  git remote remove new-branch
  rm -rf "../swh:1:rev:$revision.git"
done

git branch -m default main

git remote add origin https://github.com/thaliaarchi/cuchaz-minecraft-mappings
