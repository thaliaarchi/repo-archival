# kspalaiologos/recreational

kspalaiologos' code golf and other programming puzzle solutions lived in
https://web.archive.org/web/20230622203235/https://github.com/kspalaiologos/codegolf-submissions,
from 2019-08-14 to 2022-03-21, which I've mirrored at https://github.com/wspace/kspalaiologos-codegolf.
She restarted in https://github.com/kspalaiologos/recreational with an empty
Git history on 2022-03-02 and copied the codegolf-submissions files into it on
2023-11-12. Between that time, sporadic commits were made in both repos.

I have merged the repos in two ways:

- [interleave.sh](./interleave.sh) rebases the repos so their commits are
  interleaved chronologically into one linear history. Any commits after the
  first commit in recreational will have different hashes and need to be
  force-pushed.

- [graft.sh](./graft.sh) replaces [1f9b505](https://github.com/kspalaiologos/recreational/commit/1f9b5057f9a9786b37c11f784b3102541ea39668)
  (Update README.md, 2023-12-14) with a merge commit, which is exactly the same,
  except its second parent is the history of codegolf-submissions. This creates
  a replace ref, which replaces the original commit with another in operations
  like `git log` and `git blame`, but only in rendering, not actually the object
  itself. Replace refs, unfortunately are not fetched from GitHub by other
  people, even if you pushed them, so no one else would see the old history.
