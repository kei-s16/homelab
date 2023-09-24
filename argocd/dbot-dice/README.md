## dbot-dice
DiscordのDicebotを動かすためのhelm chart  

src: [kei-s16/dbot-dice](https://github.com/kei-s16/dbot-dice)

### 事前設定
アプリで使う環境変数を、dbot-dice-secretsの名前で登録しておく

```
example $ kubectl create secret generic --save-config dbot-dice-secrets --from-env-file ./dbot-dice -n discord-bot
```
