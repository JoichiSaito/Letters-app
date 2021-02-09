# Letters

### サービス概要
私は以前、小学校で教員として勤務していました。普段、保護者に学校行事への参加の是非を問う際は、教員がお知らせとアンケート用紙が一緒になったプリントを印刷・配布し、集約しています。  
しかし、このような集約方法には以下の課題があります。  

①プリントの印刷やアンケートの返答の手作業での集約に時間がかかること  
②教員の配布し忘れや児童がプリントをもらい忘れたり、なくしたり、保護者に渡し忘れたりする可能性があること  

そこで、私は紙媒体ではなくアプリ上にそのようなアンケート機能がついたお知らせを投稿することができるこのアプリを作成しました。このアプリにより上記の課題を解決し、教員の業務効率の向上、保護者の負担軽減につなげることができると私は考えています。  

### アプリの機能一覧  
①ユーザー登録・ログイン機能  
②投稿作成・編集・削除機能  
③ユーザーフォロー・フォローリクエスト機能  
④アカウント公開・非公開選択機能  
⑤参加・キャンセルボタンを用いたアンケート機能  
⑥アンケート集約・結果一覧表示機能  
⑦フォロー・フォロワー一覧表示機能  
⑧ユーザー検索機能  
⑨ページネーション機能  

### ER図  
![2021-02-07 18 54のイメージ](https://user-images.githubusercontent.com/72738659/107143389-256fad80-6978-11eb-9ed9-0f36fd797165.jpg)  
  
### ビューの相関図  
![2021-02-07 19 01のイメージ](https://user-images.githubusercontent.com/72738659/107143395-299bcb00-6978-11eb-9358-de54f6bb8e6b.jpg)  
  
### 工夫したところ
①データベースへの負担を軽減するために以下の点に留意してアプリを実装したところ  
・Ajax通信を用いたフォロー・リクエスト・参加ボタンの実装  
・N＋1問題が起きていないかbullet gemを用いてコードチェックを行ったこと  
・kaminari gemを用いた１ページあたりのデータ表示件数の管理

②投稿にアンケート機能を任意で設定可能にし、アンケートなしのお知らせも投稿できるようにしたところ  
  
③フォロー機能、フォロー一覧ページを実装し、見たいユーザーにすぐにアクセスできるようにしたところ  
  
④参加ボタンを押したユーザーを表示するページを実装し、アンケート結果を素早く集約できるようにしたところ  
  
⑤アカウント公開・非公開選択機能を実装し、その学校の保護者以外はフォロー許可が無いとお知らせを見ることができないようにしたところ  
  
⑥メニューバーにレスポンシブデザインを取り入れ、小さい画面でも操作しやすくしたところ  
  
⑦GitHubの機能を活用し、「issueを確認 -> branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」といったチーム開発の流れを疑似的に再現するなど、より実践的な環境で作業を進めたところ  
  
  
## 使用技術　
・開発環境 (Docker)  
・バックエンド言語 (Ruby 2.6.3)  
・バックエンドFW (Ruby on Rails 5.2.4)  
・フロントエンド言語・ライブラリ (JavaScript、jQuery)  
・CSSフレームワーク（Bootstrap4）  
・インフラ (AWS EC2)  
・独自ドメイン取得 (AWS Route53)  
・HTTPS化 (AWS ACM、ELB)  
・データベース (MySQL)  
・テスト （RSpec、Capybara、Factory_Bot）  
・コードチェック （Bullet、RuboCop）  
・フォロー・リクエスト・参加ボタン (Ajax)  
・ページネーション（kaminari）  
・検索 （ransack）  
・多言語化対応 (i18n)   
・パスワードハッシュ化 (bcrypt)  


## URL  
ゲストユーザー(保護者側のサンプルアカウント)  
メールアドレス：rails@taro.com  
パスワード：railstaro  
  
https://forschool.letters-app.com/  
  
トップページのリンク「ゲストユーザーとしてログインする」からログインページへアクセスできます。  
