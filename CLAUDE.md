# Space

## プロジェクト概要
SNSアプリ。自分が実際に使いながらRailsの設計・パフォーマンスを学ぶことを目的とする。

## 構成
- `backend/` : Ruby on Rails（APIモード） → 詳細は `backend/CLAUDE.md`
- `frontend/` : React + TypeScript + Vite → 詳細は `frontend/CLAUDE.md`
- `docker-compose.yml` : PostgreSQL

## 技術スタック
- Ruby 3.4.7 / Rails 8.1.3
- PostgreSQL（Docker）
- React + TypeScript + Vite
- デプロイ：Render（API）+ Vercel（フロント）

## ローカル開発の起動方法
```bash
# DB起動
docker compose up -d

# バックエンド
cd backend
bin/rails server

# フロントエンド
cd frontend
npm run dev
```

## 開発方針
- 実装前に必ずDesign Docを書く
- Design Docには「選んだ設計」「検討した他の選択肢」「トレードオフ」を必ず記載する
- Railsの設計学習が主目的のため、Railsらしい設計を優先する

## コード規約（共通）
- コメントは日本語OK

## 環境変数
`.env`に記載。`.env.example`を参照。
GitHubには`.env`をpushしない。