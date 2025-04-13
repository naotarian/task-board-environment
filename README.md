# 🐳 フルスタック開発環境セットアップ（Django + MySQL + Next.js）

このプロジェクトは、バックエンドに **Django**, フロントエンドに **Next.js (TypeScript)** を使ったモダンな Web 開発環境です。

Docker を使うことで、**PC の環境に関係なく、誰でも同じ環境で開発を始められます！**

---

## 🔧 このプロジェクトで使うもの

| サービス名     | 説明                                                                        |
| -------------- | --------------------------------------------------------------------------- |
| **Django**     | バックエンド（API サーバー）                                                |
| **Next.js**    | フロントエンド（画面側）                                                    |
| **MySQL**      | データベース                                                                |
| **phpMyAdmin** | ブラウザから DB を操作できるツール                                          |
| **Mailhog**    | メール送信の動作確認用ツール（本物のメールは送られません）                  |
| **Nginx**      | リバースプロキシ（`/api/` を Django に、それ以外を Next.js に振り分けます） |

---

## 📂 ファイル構成

```
プロジェクトルート/
├── docker-compose.yaml           # Dockerサービス定義ファイル（全体）
├── .env                          # 環境変数（DB, メール設定など）
├── README.md                     # 初期セットアップ手順書（このファイル）

├── nginx/
│   └── default.conf              # Nginxのリバースプロキシ設定

├── backend/                      # Django アプリケーション
│   ├── Dockerfile                # Django 用の Dockerfile
│   ├── requirements.txt          # 必要な Python パッケージ一覧
│   └── manage.py                 # Django エントリーポイント（startproject 後に追加）

├── frontend/                     # Next.js アプリケーション
│   ├── Dockerfile                # Next.js 用の Dockerfile
│   ├── package.json              # Node.js の依存関係定義
│   ├── yarn.lock                 # Yarn の依存バージョン固定ファイル
│   ├── tsconfig.json             # TypeScript 設定
│   ├── next.config.js            # Next.js の設定ファイル
│   └── pages/                    # ページコンポーネント（ルーティング）
│       └── index.tsx            # トップページ（例）

```
