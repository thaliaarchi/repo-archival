#!/bin/bash -e

. base.sh

mkdir -p wspace
cd wspace

mkdir kevincruijssen-codegolf
cd kevincruijssen-codegolf
git init -q

commit_post() {
  local ident="$1"
  local slug="$2"
  local message="$3"
  local revision_url="$4"
  local source_url="$5"

  mkdir -p "$slug"
  get_cached "$source_url" "$slug/answer.html"

  # Extract answer from page
  htmlq --text 'body > pre' -o "$slug/README.md" < "$slug/answer.html"
  rm "$slug/answer.html"
  # Remove superfluous LF at the end of the file from htmlq serialization
  truncate -s-1 "$slug/README.md"
  # Extract code block from answer
  grep '^    ' "$slug/README.md" | cut -b5- > "$slug/code.ws"
  git add "$slug"

  commit "$ident" "$message

$revision_url"
}

# Kevin is located in the Netherlands
KEVIN='Kevin Cruijssen <>'
COMMUNITY='Community [bot] <>'

# All Your Base Are Belong To Us (Restricted)                                       https://codegolf.stackexchange.com/questions/19171/all-your-base-are-belong-to-us-restricted/161445#161445
# 2018-04-06 09:10:53Z Posted by Kevin Cruijssen                                    https://codegolf.stackexchange.com/revisions/161445/1 https://codegolf.stackexchange.com/revisions/01bfc4ca-bb88-4356-a413-1649b13884af/view-source
# 2020-06-17 09:04:33Z "Commonmark migration" by Community [bot]                    https://codegolf.stackexchange.com/revisions/161445/2 https://codegolf.stackexchange.com/revisions/1b0daa8c-9719-46cc-8fee-5215e3b7fa79/view-source

# Print a 10 by 10 grid of asterisks                                                https://codegolf.stackexchange.com/questions/88653/print-a-10-by-10-grid-of-asterisks/165417#165417
# 2018-05-25 09:35:34Z Posted by Kevin Cruijssen                                    https://codegolf.stackexchange.com/revisions/165417/1 https://codegolf.stackexchange.com/revisions/5ad4d964-ce06-41aa-ac0a-6a1433779093/view-source
# 2020-06-17 09:04:33Z "Commonmark migration" by Community [bot]                    https://codegolf.stackexchange.com/revisions/165417/2 https://codegolf.stackexchange.com/revisions/9818ab53-c576-4a4b-a01f-175e8d3e0d8c/view-source

# Shortest Error Message                                                            https://codegolf.stackexchange.com/questions/133840/shortest-error-message/167509#167509
# 2018-06-27 12:57:14Z Posted by Kevin Cruijssen                                    https://codegolf.stackexchange.com/revisions/167509/1 https://codegolf.stackexchange.com/revisions/df4b65aa-53d8-46c8-a840-9fa4801383b4/view-source
# 2018-06-27 13:06:20Z "added 746 characters in body" by Kevin Cruijssen            https://codegolf.stackexchange.com/revisions/167509/2 https://codegolf.stackexchange.com/revisions/95314de4-1342-400a-9786-8a0e963b9ba0/view-source
# 2018-06-27 13:15:06Z "added 151 characters in body" by Kevin Cruijssen            https://codegolf.stackexchange.com/revisions/167509/3 https://codegolf.stackexchange.com/revisions/fb27e483-8601-48c1-be57-d5978afb149d/view-source
# 2018-07-02 11:29:35Z "Fixed the TIO and added some more TIOs." by Kevin Cruijssen https://codegolf.stackexchange.com/revisions/167509/4 https://codegolf.stackexchange.com/revisions/c1e7b91f-6429-4fe5-bd10-4ddf47bc6171/view-source
# 2020-06-17 09:04:33Z "Commonmark migration" by Community [bot]                    https://codegolf.stackexchange.com/revisions/167509/5 https://codegolf.stackexchange.com/revisions/3edf4e9e-4506-4f0e-8266-24035f1e03b9/view-source

# Implementing a stack                                                              https://codegolf.stackexchange.com/questions/169343/implementing-a-stack/169353#169353
# 2018-07-27 12:25:19Z Posted by Kevin Cruijssen                                    https://codegolf.stackexchange.com/revisions/169353/1 https://codegolf.stackexchange.com/revisions/1f26efcd-e382-4fae-9811-d2e95faaabd6/view-source
# 2020-06-17 09:04:33Z "Commonmark migration" by Community [bot]                    https://codegolf.stackexchange.com/revisions/169353/2 https://codegolf.stackexchange.com/revisions/b771e6fb-e65f-48e0-aa27-89d8111248c7/view-source

# The shortest code to invert bit-wise a binary string                              https://codegolf.stackexchange.com/questions/30361/the-shortest-code-to-invert-bit-wise-a-binary-string/178316#178316
# 2019-01-03 13:47:44Z Posted by Kevin Cruijssen                                    https://codegolf.stackexchange.com/revisions/178316/1 https://codegolf.stackexchange.com/revisions/fb942602-3fd5-4a91-817a-13d017c3f87b/view-source
# 2020-06-17 09:04:33Z "Commonmark migration" by Community [bot]                    https://codegolf.stackexchange.com/revisions/178316/2 https://codegolf.stackexchange.com/revisions/fde2bb16-f410-4a77-bc0e-179ab20a5346/view-source

# Follow a linked list                                                              https://codegolf.stackexchange.com/questions/216196/follow-a-linked-list/216208#216208
# 2020-12-11 15:28:24Z Posted by Kevin Cruijssen                                    https://codegolf.stackexchange.com/revisions/216208/1 https://codegolf.stackexchange.com/revisions/32bf5063-898b-40b5-b1f2-1828d55cf247/view-source

# Am I divisible by double the sum of my digits?                                    https://codegolf.stackexchange.com/questions/129596/am-i-divisible-by-double-the-sum-of-my-digits/217735#217735
# 2021-01-19 08:07:24Z Posted by Kevin Cruijssen                                    https://codegolf.stackexchange.com/revisions/217735/1 https://codegolf.stackexchange.com/revisions/e378ec81-fcac-41dc-ac71-e2183ce3522e/view-source

# TODO: Extract programs from TIO links and handle multiple code blocks

commit_post "$KEVIN 2018-04-06 09:10:53Z"     all-your-base-are-belong-to-us-restricted            'All Your Base Are Belong To Us (Restricted)'          https://codegolf.stackexchange.com/revisions/161445/1 https://codegolf.stackexchange.com/revisions/01bfc4ca-bb88-4356-a413-1649b13884af/view-source
commit_post "$KEVIN 2018-05-25 09:35:34Z"     print-a-10-by-10-grid-of-asterisks                   'Print a 10 by 10 grid of asterisks'                   https://codegolf.stackexchange.com/revisions/165417/1 https://codegolf.stackexchange.com/revisions/5ad4d964-ce06-41aa-ac0a-6a1433779093/view-source
commit_post "$KEVIN 2018-06-27 12:57:14Z"     shortest-error-message                               'Shortest Error Message'                               https://codegolf.stackexchange.com/revisions/167509/1 https://codegolf.stackexchange.com/revisions/df4b65aa-53d8-46c8-a840-9fa4801383b4/view-source
commit_post "$KEVIN 2018-06-27 13:06:20Z"     shortest-error-message                               'added 746 characters in body'                         https://codegolf.stackexchange.com/revisions/167509/2 https://codegolf.stackexchange.com/revisions/95314de4-1342-400a-9786-8a0e963b9ba0/view-source
commit_post "$KEVIN 2018-06-27 13:15:06Z"     shortest-error-message                               'added 151 characters in body'                         https://codegolf.stackexchange.com/revisions/167509/3 https://codegolf.stackexchange.com/revisions/fb27e483-8601-48c1-be57-d5978afb149d/view-source
commit_post "$KEVIN 2018-07-02 11:29:35Z"     shortest-error-message                               'Fixed the TIO and added some more TIOs.'              https://codegolf.stackexchange.com/revisions/167509/4 https://codegolf.stackexchange.com/revisions/c1e7b91f-6429-4fe5-bd10-4ddf47bc6171/view-source
commit_post "$KEVIN 2018-07-27 12:25:19Z"     implementing-a-stack                                 'Implementing a stack'                                 https://codegolf.stackexchange.com/revisions/169353/1 https://codegolf.stackexchange.com/revisions/1f26efcd-e382-4fae-9811-d2e95faaabd6/view-source
commit_post "$KEVIN 2019-01-03 13:47:44Z"     the-shortest-code-to-invert-bit-wise-a-binary-string 'The shortest code to invert bit-wise a binary string' https://codegolf.stackexchange.com/revisions/178316/1 https://codegolf.stackexchange.com/revisions/fb942602-3fd5-4a91-817a-13d017c3f87b/view-source

commit_post "$COMMUNITY 2020-06-17 09:04:33Z" all-your-base-are-belong-to-us-restricted            'Commonmark migration'                                 https://codegolf.stackexchange.com/revisions/161445/2 https://codegolf.stackexchange.com/revisions/1b0daa8c-9719-46cc-8fee-5215e3b7fa79/view-source
commit_post "$COMMUNITY 2020-06-17 09:04:33Z" print-a-10-by-10-grid-of-asterisks                   'Commonmark migration'                                 https://codegolf.stackexchange.com/revisions/165417/2 https://codegolf.stackexchange.com/revisions/9818ab53-c576-4a4b-a01f-175e8d3e0d8c/view-source
commit_post "$COMMUNITY 2020-06-17 09:04:33Z" shortest-error-message                               'Commonmark migration'                                 https://codegolf.stackexchange.com/revisions/167509/5 https://codegolf.stackexchange.com/revisions/3edf4e9e-4506-4f0e-8266-24035f1e03b9/view-source
commit_post "$COMMUNITY 2020-06-17 09:04:33Z" implementing-a-stack                                 'Commonmark migration'                                 https://codegolf.stackexchange.com/revisions/169353/2 https://codegolf.stackexchange.com/revisions/b771e6fb-e65f-48e0-aa27-89d8111248c7/view-source
commit_post "$COMMUNITY 2020-06-17 09:04:33Z" the-shortest-code-to-invert-bit-wise-a-binary-string 'Commonmark migration'                                 https://codegolf.stackexchange.com/revisions/178316/2 https://codegolf.stackexchange.com/revisions/fde2bb16-f410-4a77-bc0e-179ab20a5346/view-source
git reset --soft HEAD~5
commit "$COMMUNITY 2020-06-17 09:04:33Z" 'Commonmark migration

https://codegolf.stackexchange.com/revisions/161445/2
https://codegolf.stackexchange.com/revisions/165417/2
https://codegolf.stackexchange.com/revisions/167509/5
https://codegolf.stackexchange.com/revisions/169353/2
https://codegolf.stackexchange.com/revisions/178316/2'

commit_post "$KEVIN 2020-12-11 15:28:24Z"     follow-a-linked-list                                 'Follow a linked list'                                 https://codegolf.stackexchange.com/revisions/216208/1 https://codegolf.stackexchange.com/revisions/32bf5063-898b-40b5-b1f2-1828d55cf247/view-source
commit_post "$KEVIN 2021-01-19 08:07:24Z"     am-i-divisible-by-double-the-sum-of-my-digits        'Am I divisible by double the sum of my digits?'       https://codegolf.stackexchange.com/revisions/217735/1 https://codegolf.stackexchange.com/revisions/e378ec81-fcac-41dc-ac71-e2183ce3522e/view-source
