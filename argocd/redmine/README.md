## redmine
自宅redmineを動かすためのhelm chart  

### 事前設定
アプリで使う環境変数を、redmine-secretsの名前で登録しておく

```
example $ kubectl create secret generic --save-config redmine-secrets --from-env-file ./redmine -n redmine
```
