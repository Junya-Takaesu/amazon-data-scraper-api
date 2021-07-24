# Amazon Data Scraper API

- チュートリアルの動画
  - [Turn an API into a Startup?! Build & Sell an API with JavaScript - YouTube](https://www.youtube.com/watch?v=be9sHQ7xqo0)

## 使用するライブラリ
- `express`
  - nodejs のバックエンドフレームワーク
- `request-promise`
  - API リクエストを実行する
- `nodemon`
  - ファイルの変更があったときにターミナルをリロードする

## API サーバーをローカルで起動
> ※各種 docker コマンドは、プロジェクトルート(README.mdがある階層)で実行すること
### 1. npm install
docker の nodejs コンテナで、npm install をして package.json の内容をインストールする(node_modules フォルダが作られる)
```
docker run -v $(pwd)/app:/app node:14.17.3 sh -c "cd /app && npm install"
```

### 2. npm run dev
以下のコマンドを実行すると、http://localhost:5000 に対してリクエストができるようになる
```
docker run --name amazon-scraper -d --rm -p 5000:5000 -v $(pwd)/app:/app node:14.17.3 sh -c "cd /app && npm run dev"
```
- `npm run dev`
  - `nodemon` でサーバーを実行する
  - サーバー動かしながら開発できる

ブラウザで下記のようなURLを入力してリクエストする
```
http://localhost:5000/products/B08M3DC3B1?api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
- `api_key`
  - api_key として、ScraperAPI の API Key を指定する。API Key は ScaperAPI のダッシュボードで確認できる。
    - [ScraperAPI Dashboard](https://dashboard.scraperapi.com/dashboard)
- 最後のパスは、amazon の puroduct id。商品ページのURLの dp というパスの次の文字列がそれ。

### 3. npm run start
```
docker run --name amazon-scraper -d --rm --env PORT=80 -p 80:80 -v $(pwd)/app:/app node:14.17.3 sh -c "cd /app && npm run start"
```
- ポート番号 80 で、npm run start を実行する。
- docker の実行時に環境変数 PORT に80を設定している

```
http://localhost/search/%E3%83%97%E3%83%AC%E3%82%B9%E3%83%86?api_key=b06be548b66fac4f9106740e6fde37ad
```
- これで起動した API サーバーにリクエストするときは、ポートはデフォルトでOK