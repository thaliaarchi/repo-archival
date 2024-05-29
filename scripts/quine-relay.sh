#!/bin/bash -e

. base.sh

# The spoiler branch is automatically force-pushed by a GitHub Action (and
# formerly Travis CI), so only the latest version is available. As far as I can
# tell, orphaned commits cannot be fetched from GitHub unless the hash is known,
# so I have gathered the hashes of older versions preserved in GitHub forks and
# Software Heritage archive snapshots.

# Recent pushes can be queried with:
# curl 'https://api.github.com/repos/mame/quine-relay/events?per_page=100&page=1' > events1.json
# curl 'https://api.github.com/repos/mame/quine-relay/events?per_page=100&page=2' > events2.json
# curl 'https://api.github.com/repos/mame/quine-relay/events?per_page=100&page=3' > events3.json
# jq '.[] | select(.payload.ref == "refs/heads/spoiler") |
#     { head: .payload.head, before: .payload.before, created_at }' events1.json events2.json events3.json

# Commits on the spoiler branch with corresponding commits on master
commit_pairs=(
  # spoiler commit                          master commit                               spoiler committer date      master committer date
  '609904e09457a34736b2e99fa0e0ff4783f1ddb3,653271704daac18e2cd91277a9c13895e84d0dec' # 2015-10-13 03:11:10 +0900 / 2015-10-14 22:01:08 +0900
  'ef2693459f86ae19c10d2f0a4a9378aa2cae18d5,5029ce6e9e6c00323b7deb65c489801cbda59231' # 2015-10-15 00:54:15 +0900 / 2015-10-14 22:22:11 +0900
  'd57f7e09833f676923e0d67d3ce8ac8cbe05bd33,2f2171852a7383c94bc041ec314d344ee45b7c02' # 2015-11-04 00:43:51 +0900 / 2015-11-04 00:15:04 +0900
  '511d6e9f400baa0a924d14d74da5d139507fdd86,0c5b5d4481010653afa71f36df7cb3b9861773a3' # 2016-01-26 22:04:26 +0900 / 2016-01-26 21:34:21 +0900
  '33dc555c8bfe2d0731dc8c7e8f1ca8a9fa23ff78,86f3b4d17faac3b9626dd35eaaada055e12769fa' # 2016-03-02 01:15:15 +0900 / 2016-03-02 00:35:04 +0900
  '2c206f6589cb42e0bb7d3d564a3f204c0ecabce9,06d1c7a4750a6142527f11900621af9a2a9ba0cd' # 2016-04-23 01:10:10 +0900 / 2016-04-23 00:34:00 +0900
  '6bcc7db6e848dea9137930de7c7c6eb819fec284,9e3cf6c31d2bad658e8ddfcb6a720f949755b746' # 2016-05-03 00:29:19 +0900 / 2016-05-02 23:23:49 +0900
  '937f8b6b2fe27fab003614b07a3685898caa6a66,7ce3de0268ed5e2d1d387fd4403be8b1a7f654f9' # 2016-10-18 21:30:15 +0900 / 2016-10-18 21:05:40 +0900
  '11b0384412fc05cc3374c87bcd568e2b89f75f55,8059330eee6f0420079efc0ede4a600c219f15a7' # 2017-04-07 08:13:05 +0900 / 2017-04-07 07:45:01 +0900
  'bee44d40a8db926aa7229041afcb4f77c61e370f,b63549b9fc84762b5f8717558fa202f740a3f4e7' # 2017-04-18 20:49:19 +0900 / 2017-04-18 20:21:33 +0900
  '948cbb421307cadc2470aa65a158459d0937b35b,c803d450238941b90e9e5c6de6785d93cb2ecce5' # 2017-07-04 20:53:21 +0900 / 2017-07-04 20:33:33 +0900
  '0dd4bab5d9ce8fdee0628c7941e6a64c1c5201c4,81d88adbbc31b4329fd605caddfc95767e09c515' # 2017-10-07 22:03:28 +0900 / 2017-10-07 21:45:48 +0900
  '7bae13f533b2fdba6c6b18a05ed23e55305f875e,88459c5bb32ddd887128ba9f97ae78a3b05244e0' # 2018-09-01 20:21:41 +0900 / 2018-09-01 20:00:37 +0900
  '849994d65d16021cd1e972d82478e85b5d6084fb,085dda8ff4791be3151f4d024819007bace45baf' # 2018-09-02 18:06:29 +0900 / 2018-09-02 17:45:20 +0900
  '4e3c920977e73e4423b16b1a6833c2ba27cdfb22,87c80c82a846d6ee6be9d2c14c95ebdded507e46' # 2019-04-27 20:36:53 +0900 / 2019-04-27 20:14:50 +0900
  '45587912ee9ee08dad3a05627e40ea470cc7ebbf,c8898351500682cea02219313e9203da7eca5505' # 2019-06-01 22:09:59 +0900 / 2019-06-01 21:47:05 +0900
  '15547cb5c2f0ad9d14b80f116968e38bbb5a7892,a91257db920f0f169d8645255bac8d572425aa30' # 2019-06-02 10:17:21 +0900 / 2019-06-02 09:45:45 +0900
  '1ddce938b811292144010c1a23a0157d8cb44e68,0a3a41b1debac8b20fac3f9d9f455fa2bf78ef91' # 2019-08-28 01:32:41 +0900 / 2019-08-28 01:08:46 +0900
  '6cd6532edac598ebf1a25739fd28b51376d2df75,be0ccaca7ae873ba8511ea5563c01c1756c8dc3a' # 2019-11-02 14:00:58 +0900 / 2019-11-02 13:15:45 +0900
  '3a2870391ac3de981c95dcc898b55c49236881dd,af698ce8766ea89819a2e534f499ebbaa0522ded' # 2020-04-24 12:08:12 +0900 / 2020-04-24 11:49:03 +0900
  '9fc7810e93ecd9a08e73b1fc50ffb55f446d8a0e,5a8e02780997da5c3f8a22b5b27ad9fdff7d5dd9' # 2020-04-26 04:12:48 +0900 / 2020-04-26 03:53:32 +0900
  'e5804fefa814c896e154c30ab69878d0882100de,faab6c801ae897d7b531b49c3bdd6672ab79dd9d' # 2020-05-21 13:53:14 +0900 / 2020-05-21 13:33:37 +0900
  '6d2c125ebe2798afba631ddcf650b0f5b16fb591,7b1b8af52fd8ec2f1596a570e051fa23aa8f8c2f' # 2020-07-20 09:11:26 +0900 / 2020-07-20 08:52:43 +0900
  '981c8daa2045250558627acadbc8854e3502b44b,deddbd7c0452b2e99da78000de03197c5cadc76f' # 2020-12-28 23:01:42 +0900 / 2020-12-28 22:34:59 +0900
  'fa3c7e6ef651ebea62bef3dad17e57e513195811,e1d31313fc0d6287a0795cfb4edb303d41162203' # 2021-03-25 22:26:34 +0900 / 2021-03-25 21:59:35 +0900
  'f8487cc366c0b78829bba17cfcefd54f775a39dd,d4ef885cbf84968ca07f7ca19bdc3e2ca16c45d3' # 2021-04-07 01:07:34 +0900 / 2021-04-07 00:44:53 +0900
  '8e7ae10d14e8e8631a6af0586f1d5c9abbb99a80,b1b2c26756b43ed69577cf6b3787fb8766dde3e4' # 2021-04-25 12:06:21 +0900 / 2021-04-25 11:43:10 +0900
  'a1a43ee5d012fc09f112f08c18aedddab551b05f,f5cf4820d35be07e36a7db46e642337dd8fa6c42' # 2021-07-23 22:42:49 +0900 / 2021-07-23 22:17:19 +0900
  '34af6f4d45e4bd43f7aea048eb4e86d912c7ec74,52c1fbba873e3a665f3575d56704d8110567ce5a' # 2021-11-03 03:47:24 +0900 / 2021-11-03 03:23:52 +0900
  '1425be38287dfca9a49c652b7f5e28c1821d71d1,51fa40f4cc88927e50a704acbc29c63cf557b5c0' # 2022-04-22 09:46:27 +0900 / 2022-04-22 05:31:46 +0900
  '8092641321c0f683e3293c90dd908348b4ab3506,39c0ba8e366ddd868c14caeebb795343a9b42191' # 2022-06-03 12:23:49 +0900 / 2022-06-03 12:00:36 +0900
  # '? (created by GitHub Actions)         ,8982189ceab07c445a97583c19607d6ce5e8aa8a' #                           / 2022-10-26 04:31:39 +0900
  # '? (created by GitHub Actions)         ,c637133d9d17585f65d92eb93531b66b4106435d' #                           / 2022-10-26 04:54:38 +0900
  '6f431b584914a84f035d20cf5113d9a7af56cedb,0e2b7a5b4f85c573bb71ef0a6d364591b54b83a8' # 2022-10-26 05:14:21 +0900 / 2022-10-26 04:57:07 +0900
  '13d818a389d63b71df320cd9d3817be96c365c98,eb58b7ccd47c631a9eedaa72d3a265884ff63b8b' # 2022-10-31 17:24:24 +0900 / 2022-10-31 17:06:01 +0900
  'bc0943336c6e83ae2977a41788f0eff217287bc9,5dfdada5aa58f6a97ae85b84f86c7eb091225a8c' # 2023-04-30 01:36:59 +0900 / 2023-04-30 01:11:56 +0900
  # '? (created by GitHub Actions)         ,c9caa30f5e64d3ebb14e647878c727f5d5da52f7' #                           / 2023-05-18 03:37:33 +0900
  'd9745f8666c86f56c3602dd24f5c00783b1f2cd4,285bf2502f5393c5d1ffd1883f4ffb5cd32e32bd' # 2023-05-18 04:08:57 +0900 / 2023-05-18 03:45:23 +0900
  '284629f632290b99212909d10c6c489e97913027,ce091888ce0903ff44e7fef2194f7c29e6b17b73' # 2023-08-08 23:10:17 +0900 / 2023-08-08 20:16:52 +0800
  '4ae0f033435800f0825f9b72b3a25b862d011e6e,880a0061be06cc50a33b20fcff4ea4f3c2f29204' # 2023-10-01 23:47:55 +0900 / 2023-10-01 23:30:54 +0900
  'ba25e3f907ce75331a897ce0e4ba5128e70ac13e,3c4a882af448d33c9dc1edfea431894e3187595b' # 2023-10-02 01:41:52 +0900 / 2023-10-02 01:19:29 +0900
  '4f2049459c3e561e3f3d4032a431133c80483452,e16a2ceeaa974e897587820f8bfb9c9a823c235e' # 2023-10-05 13:17:38 +0900 / 2023-10-05 12:55:48 +0900
  'b97f1718d395e88a8112ef9ed9f015938c4aad05,b6dc00456383021c5cdf523e2b1017ca55250dbf' # 2023-11-01 05:16:08 +0900 / 2023-11-01 04:58:19 +0900
  'b96f6e5c1925f4a8d2743c783803b177b8f5a51e,db6a83478ef37ad264163c7317190443ed4a44a0' # 2023-11-01 05:22:48 +0900 / 2023-11-01 05:00:43 +0900
  'aa24e677d9384c118c173e2be37e410381dc1dba,f1ced6b5f3e9bae3b8313da3268b76f28c38e71c' # 2023-11-01 05:23:36 +0900 / 2023-11-01 05:02:48 +0900
  'fb717555c236bbc09efa111f4ff60f301c1b5f6c,0943fd45b6cb1ffdad926b949d897eea0b4ffe34' # 2023-11-01 05:34:43 +0900 / 2023-11-01 05:14:36 +0900
  '4cf3bd08251fe6c2b7952d2691adfe58b0cc7979,df3323ea460879b92b59fd8d6b71de9753206db9' # 2023-11-01 05:41:42 +0900 / 2023-11-01 05:23:44 +0900
  'a760af845a332b96282302c8f437c0e3508154e1,2e2103eb44e67023b51fde35d3e2ebe68b24047e' # 2023-11-01 05:48:11 +0900 / 2023-11-01 05:27:11 +0900
  'b7e24f2e6be5e8090a3990f0c1f6beb5e8778540,26066d1ede0b91720baceecbd99dbdf7e4d3240b' # 2023-11-01 06:00:49 +0900 / 2023-11-01 05:39:34 +0900
  '708c3129caa779f7a61402e93a45de951e428eb4,3ca0776f455748be1dff0439d65fc55d0cb0a37b' # 2024-04-26 06:19:03 +0900 / 2024-04-27 06:03:17 +0900
  '04edc82a865c59cae390aaaf6e980d46bb93f9da,20d7f437c053b8e0b301ba996d124a4b812e3571' # 2024-04-26 06:25:15 +0900 / 2024-04-27 06:05:46 +0900
  'a04f6ef7505bd3fb8a4034c6230e994f19cdca5d,f367bbdb5fb0f468f63b2ee9cd29b2d0471dca8b' # 2024-04-27 15:34:32 +0900 / 2024-04-27 15:20:55 +0900
)

# Fetch all orphaned spoiler commits
git -C "$TOPLEVEL/git/github.com/mame/quine-relay@master" fetch -q origin "${commit_pairs[@]%%,*}"

clone_submodule https://github.com/mame/quine-relay@master quine-relay
cd quine-relay

# Checkout the first master commit that has a corresponding spoiler commit
git checkout -b main "${commit_pairs[0]#*,}"

# Create merge commits for each spoiler-master pair
for pair in "${commit_pairs[@]}"; do
  spoiler="${pair%%,*}"
  master="${pair#*,}"

  git merge --allow-unrelated-histories --no-commit "$spoiler" "$master" || :

  # Resolve conflicts by checking out master's working tree and moving spoiler
  # files to spoiler/.
  git rm -qf '*'
  git checkout "$spoiler" -- '*'
  mkdir spoiler
  git mv QR.* qr.* spoiler/
  git checkout "$master" -- '*'

  # Select the later date
  date="$( (git show -s --format=%cd --date=raw "$master" &&
            git show -s --format=%cd --date=raw "$spoiler" | sed s/+0000/+0900/) | sort -r | head -n1)"
  commit "Yusuke Endoh <mame@ruby-lang.org> $date" 'Merge spoiler'

  cd spoiler
  if [[ -f ../SHA1SUMS ]]; then
    sha1sum --quiet -c ../SHA1SUMS
  elif [[ -f ../SHA256SUMS ]]; then
    # Switched to SHA-256 in 20d7f43 (Use sha256sum instead of sha1sum,
    # 2024-04-27).
    sha256sum --quiet -c ../SHA256SUMS
  else
    echo 'No SHA1SUMS or SHA256SUMS file' >&2
    exit 1
  fi
  cd ..
done

git remote set-url origin https://github.com/thaliaarchi/quine-relay-spoiler
