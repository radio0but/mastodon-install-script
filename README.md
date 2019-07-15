# TL;DR  
https://github.com/nesosuke/mastodon-install-script

- install.sh : 構築に使う  
- update.sh  : アップデートするのに使う  

(注)どちらも`mastodon`ユーザーで実行すること  



---  
## 構築
  
### ユーザー`mastodon`の作成  
  ```  
  sudo adduser mastodon
  sudo adduser mastodon sudo
  su mastodon 
  ``` 

### `install.sh`を実行.  
  ```  
  sudo bash install.sh
  ```  

### サーバードメインの指定
Input your server domain と聞かれるので,立てたいサーバーのドメインを指定する.  
httpsはつけず, `mstdn.example.com` のみで書く.   

```  
  Input your server domain w/o "http" (e.g. mstdn.example.com) > mstdn.exmple.com
```  

### SSL証明書を発行する(選択)
Obtain SSL Cert ? [y/N] と聞かれるので,前項で指定したドメインでSSL証明書を同時に取得する場合のみ`y`または`Y`とする.  
  すでに発行しているものや別途発行する場合は`N`とする.  

## RubyのインストールやMastodonのコンパイルを待つ   
特にやることはないが,ビルド時間によっては`sudo`のパスワードを再度入力する必要あり.  

---  
## アップデート  
```  
bash update.sh
```
こちらもビルド時間によっては`sudo`のパスワードを再度入力する必要あり.

---   
# 検証環境  
