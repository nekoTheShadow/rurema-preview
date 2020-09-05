# rurema-preview

Rubyの日本語マニュアルである"るりま"をローカル環境で簡単に動かすためのDockerイメージです。
るりまの修正をしたのち、想定通りに修正できているかを確認するために利用することを想定しています。

# Usage

```bash
# イメージの入手
docker pull ghcr.io/nekotheshadow/rurema-preview:latest

# doctree(るりま)のForkをcloneして、修正する。
git clone https://github.com/someRepository/doctree.git
cd doctree
do_fix

# http://localhost:10080 で修正内容を確認する。
docker run --rm -it \
    -e TARGET_VERSION=2.7.0 \
    -p 10080:10080 \
    -v $(pwd):/src \
    ghcr.io/nekotheshadow/rurema-preview
``` 

# Env

- `TARGET_VERSION`: (任意)どのバージョンのドキュメントを生成するのかを決めます。指定しない場合のデフォルト値はRubyの最新バージョン