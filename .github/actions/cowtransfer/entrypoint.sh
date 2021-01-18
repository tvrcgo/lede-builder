#!/bin/sh -l

TAG=${GITHUB_REF##*/}-${GITHUB_RUN_ID}-$(date +"%s")

cow_opts=$([[ ! -z $OPTIONS ]] && echo $OPTIONS || echo "--block 2621440 -s -p 64 --no-progress")

curl -fsSL git.io/file-transfer | sh
./transfer cow ${cow_opts} ${FILES} 2>&1 | tee cowtransfer.log
echo "::warning file=CowTransfer::$(cat cowtransfer.log | grep https)"
echo "::set-output name=url::$(cat cowtransfer.log | grep https | cut -f3 -d" ")"
