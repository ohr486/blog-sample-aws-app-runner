#!/bin/bash

echo "----- start apache bench -----"

#HOST=SET_TARGET_HOST

# demo1
HOST=https://8zyeju2nf6.ap-northeast-1.awsapprunner.com/

# demo2
#HOST=https://3qcejrptyr.ap-northeast-1.awsapprunner.com/

echo "host: $HOST"

# 同時接続数
CONC=200
# 毎秒あたりの1接続でのリクエスト数
REC_PER_CON=20
# テスト時間
TIME=0.1m
echo "同時接続:$CONC / Req/Con/Sec:$REC_PER_CON / テスト時間:$TIME"

siege -c $CONC -r $REC_PER_CON --time $TIME $HOST
