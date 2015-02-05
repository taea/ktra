# K-tra!
The Lightweight Task Tracker.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

![](https://dltvadzlmcsl3.cloudfront.net/uploads/post/image/22887/thumb_f2d084ee5288a867ac17055bc034f2cb.gif)

## Setup for development

rename config/application.example.yml to config/application.yml

```
$ cp config/application.example.yml config/application.yml
```

Fill your credentials for twitter.

```
$ open https://dev.twitter.com/
```

```
$ open config/application.yml
```

```
TWITTER_KEY: 'YOUR CONSUMER KEY'
TWITTER_SECRET: 'YOUR CONSUMER SECRET'
```

## Setup for test

rename Guardfile.example to Guardfile

```
$ cp Guardfile.example Guardfile
```

```
$ guard
```

## Setup for phantom.js on Mac

```
brew update
brew install phantomjs
```
