# Portfolio
![myPortfoilo](https://user-images.githubusercontent.com/71540374/101719598-fb6c4d00-3ae6-11eb-9dfd-0cc264282a86.gif)
# Overview
自己紹介とログイン機能が付いたポートフォリオサイトです。<br>
![SignUp](https://user-images.githubusercontent.com/71540374/101756489-6afb3000-3b19-11eb-81be-ef85c25d8220.gif)
開発環境の詳細はログイン後の「本サイトの開発環境について」にて紹介しています。
## Dependency
使用言語:
### フロントエンド
* #### HTML5
* #### CSS
* #### JavaScript
### バックエンド
* #### Java8 ※
* #### MySQL

※使用ライブラリ
1. Apache Tomcat8.5 v8.5[Tomcat8 (Java8)]
2. JREシステム・ライブラリー[java8]
3. mysql-connector-java-8.0.20.jar
4. taglibs-standard-impl-1.2.5.jar
5. taglibs-standard-jstlel-1.2.5.jar
6. taglibs-standard-spec-1.2.5.jar

## Description
サイトはAWS Certificate Managerからhttpsの証明書を発行し、Route53にてhttps通信を可能にしています。<br>
ログイン機能はsaltとhash(SHA-256)を用いた暗号を行っています。<br>
* ログイン機能を実装する際に参考にしたサイト(Java MD5 with salt exampleの項目を参考にしました)<br>
https://howtodoinjava.com/java/java-security/how-to-generate-secure-password-hash-md5-sha-pbkdf2-bcrypt-examples/

## Feature
* 2段階認証やメールによる認証
