#!/bin/bash

# Shell Options
# e : エラーがあったら直ちにシェルを終了
# u : 未定義変数を使用したときにエラーとする
# o : シェルオプションを有効にする
# pipefail : パイプラインの返り値を最後のエラー終了値にする (エラー終了値がない場合は0を返す)
set -euo pipefail

IP=$(which ip)

case "$PLUTO_VERB" in

  up-client)

    if [ "$PLUTO_MARK_OUT" = "100" ]; then
      VTI=vti1
      LOCAL=169.254.208.48/30
    else
      VTI=vti2
      LOCAL=169.254.125.244/30
    fi

    $IP link add $VTI type vti local $PLUTO_ME remote $PLUTO_PEER key $PLUTO_MARK_OUT
    $IP addr add $LOCAL dev $VTI
    $IP link set $VTI up

    ;;

  down-client)

    $IP link del vti1 2>/dev/null
    $IP link del vti2 2>/dev/null

    ;;

esac