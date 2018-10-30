#!/bin/bash

if [ $# -lt 1 ]; then
  echo "引数は1つ以上必要$#個です。" 1>&2
  exit 1
fi

mode=$1

case $mode in
  new)
    appname=$2
    dbname=$3
    bundle exec rails new ${appname} -T -f --webpack=react --database=${dbname} --skip-coffee --skip-sprockets
    cd ${appname}
    bundle exec rake webpacker:install
    bundle exec rake webpacker:install:react
    bundle exec rake webpacker:install:typescript
    ;;
  start)
    appname=$2
    cd ${appname}
    bundle install
    bundle exec rails server -b '0.0.0.0'
    ;;
  * )
    echo "Usage:"
    echo "  run MODE"
    echo "    Mode:"
    echo "      new   #新規railsアプリ作成"
    echo "      start #アプリケーションの開始"
    ;;
esac
