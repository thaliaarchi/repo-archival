# Software Heritage archive

A cooked git archive is requested with the [git-bare API](https://archive.softwareheritage.org/api/1/vault/git-bare/doc/),
given the git revision for HEAD:

```sh
curl -X POST https://archive.softwareheritage.org/api/1/vault/git-bare/swh:1:rev:$REVISION/
```

Mercurial Bitbucket repos are archived at
[bitbucket-archive.softwareheritage.org](https://bitbucket-archive.softwareheritage.org/).
