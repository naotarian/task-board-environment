#!/bin/sh

set -e

# MinIO が立ち上がるのを待つ（必要に応じて調整）
sleep 5

# mc (MinIO Client) 初期化
mc alias set local http://minio:9000 minio minio123

# バケット作成（すでにある場合はスキップ）
mc mb local/public --ignore-existing

# public に公開権限付与
mc anonymous set download local/public
