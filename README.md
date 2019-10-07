# docker-adventureworks

SQL Serverのサンプルデータベース「AdventureWorks」をDocker上のSQLサーバーで利用するためのコンテナイメージです。

## 前提条件

現在、動作確認しているのは以下の環境のみです。

- Docker for Windows Version 2.1.0.3

また現状では全文検索関連の機能は無効な状態です。

## 利用方法

次のような手順で実行します。

1. イメージの取得
2. コンテナの作成
3. コンテナの起動
4. 利用
5. コンテナの停止
6. コンテナの削除
7. イメージの削除

Windowsユーザーに分かりやすく説明すると以下に近いと考えて良いと思います。

- イメージの取得 > OSのISOファイルのダウンロード
- コンテナの作成 > ISOからVMへインストール
- コンテナの起動 > VMの起動
- コンテナの停止 > VMの停止
- コンテナの削除 > VMの削除
- イメージの削除 > ISOファイルの削除

### コンテナイメージの取得

```cmd
docker pull nuitsjp/adventureworks:latest
```

### コンテナの作成

取得したイメージからadventureworksという名称のコンテナを作成します。

```cmd
docker create --name adventureworks -e ACCEPT_EULA=Y -e SA_PASSWORD=P@ssw0rd! -p 1433:1433 nuitsjp/adventureworks:latest
```

ここでは、saパスワードとSQL Serverを接続するポートをあわせて指定してコンテナを作成しています。

### コンテナの起動

```cmd
docker start adventureworks
```

### 利用

SSMSでつなぐなり、プログラムから接続するなり自由に利用できます。パスワードは起動時に指定した「P@ssw0rd!」です。

### コンテナの停止

```cmd
docker stop adventureworks
```

### コンテナの削除

```cmd
docker rm adventureworks
```

### イメージの削除

```cmd
docker rmi nuitsjp/adventureworks:latest
```
