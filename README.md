# 肩こリス
エクササイズ動画を見ると、リスにどんぐりをあげることができるようになるフィットネスアプリです！

![スクリーンショット 2021-08-11 2 02 29](https://user-images.githubusercontent.com/77534629/128902827-83bff537-5030-498b-914f-20c00c354621.png)


# アプリURL
LINE botを使ったサービスなので、スマホから見るのをおすすめします！

https://katakorisu.com/ （現在は非公開）

🌷 PV数 3600PV 

🌷 友だち登録数80人
(2021年9月10日現在)

# Qiita記事
[【大学生による個人開発】肩こりはリスのせい？フィットネスアプリ「肩こリス」を作ってみた。](https://qiita.com/koshiro54600/items/9da9bfe9d66eab8862a0)

🌷 LGTM 54
(2021年9月10日現在)

# サービス概要
肩こりに悩んでいるが、運動するモチベーションがない人に<br>
エクササイズをすると、リスにどんぐりをあげられるというゲーム要素でモチベーションを与える<br>
肩こり解消サポートサービス「肩こリス」です。

# 登場人物
- エンドユーザー
  - 肩こりを解消したい人

# ユーザーが抱える課題
- 肩こりに悩んでいるが、どうしたらいいのかわからない
- 運動しようと思っているが、やる気が出ない
- 仕事や勉強中にストレッチをしたいのだが、タイミングが見つからない
- エクササイズを習慣にしようとしても3日坊主に終わってしまう

# 世界観
- 肩こりは、「肩こリス」というリスのような動物が、肩をかじっているせい。
- ストレッチをすることで、「肩こリス」にどんぐりをあげられる。どんぐりをあげると、「肩こリス」は友達になってくれて、肩をかじるのをやめてくれるようになる。

# 解決方法
肩こりを、可愛らしいキャラクターで表現することで、ポジティブな気持ちで肩こりと向き合えるようにする

# プロダクト
エクササイズ動画を見ると、どんぐりがもらえる。肩こリスにどんぐりをあげると、友達になり、肩をかじるのをやめてくれるようになる。

# 機能
- 肩こリスは、1時間に1匹ずつ増える。最大6匹まで増える。
- どんぐりをあげて、友だちになる肩こリスの数はランダムである。肩こリスの数が少ないときほど、友達になる確率は高い。
- 肩こリスが増えたときになったときにLINE通知が来る。

# マーケット
10~30代の肩こりを解消したい人


# 画面遷移図
https://xd.adobe.com/view/b025fbf5-b334-466b-8dd3-9216b1e805b0-e576/


# 使用技術
- Ruby 2.7.4
- Rails 6.1.4
- JavaScript
- LIFF(LINE Front-end Framework)
- LINE Messaging API
- YouTube Data API
- YouTube IFrame Player API
- RSpec


## 主要なGem
- line-bot-api (LINE通知)
- whenever (定期実行)
- slack-notifier (エラー通知)
- exception_notification (エラー通知)
- rubocop (コード解析)


# ER図
![ER図](https://user-images.githubusercontent.com/77534629/128905781-a12046f1-f869-4a94-936a-6a8c8bf80272.png)


# インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/77534629/134108664-5795b87b-114d-481d-8bf5-245ab55963ba.png)

