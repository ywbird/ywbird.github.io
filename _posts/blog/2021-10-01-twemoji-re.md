---
title: "Twemoji 사용 에러 해결!!!!"
date: "2021-10-01"
toc: true
toc_sticky: true
toc_label: "목차"
categories:
  - Blog
excerpt: "드디어!! 고쳐냈다ㅏㅏㅏ"
---
***

Twemoji 사용하는 법을 드디어! 알아냈습니다.

중요한 부분으로 스킵 :arrow_forward:[`하는법`](#새로운-방법)

💚아래 방법은 너무 무거워서 새로운 방법을 찾게 되었습니다!
그래도 아래 방법을 이용하면 깃허브에서 공식 지원하지 않는 플러그인을 사용할 수 있으니 꽤 유용할 겁니다!!
🏷더 가볍고 어렵지 않은 방법 링크 : [Twemoji 가볍게!](/blog/twemoji-light/)
{: .notice--success}

## 이전 오류

이전에는 `jekyll-twemoji`가 `3rd party plugin`(깃허브에서 공식 지원하지 않는 플러그인) 이어서 작동을 하지 않았습니다.

*하지만* 끝내 방법을 찾아냈습니다.

## 새로운 방법에 관한 설명

Github Action이란 GitHub에서 제공하는 액션 입니다(?)

> 정확히는 저도 잘 몰라요...
> 그냥 외부 `3rd Party Plugin`을 작동시킬 수 있다는게 중요.

메인으로 사용할 유틸은 [@helaili](https://github.com/helaili)라는 깃허브 관리자분이 만드신 [jekyll-action](https://github.com/helaili/jekyll-action)이라는 프로젝트입니다.

이 `action`은 Jekyll 코드를 `HTML` 코드로 변환시켜주는 역할을 합니다!!_(매우 중요)_
<br>
이를 이용해서 외부 플러그인을 깃헙 블로그에 불러올 수 있습니다.

## 새로운 방법

새로운 방법을 소개드리겠습니다.

### 원글(망했던글)을 그대로 따라한다.

[원글 링크](/blog/use-twemoji-jekyll/#적용하기)

### Jekyll Action을 사용한다.

#### 1. 기본 Branch를 ***main*** 으로 바꿔준다.

깃헙 리포의 기본 branch를 `main`으로 바꿔야합니다.

만약 자신의 깃헙 리포에 들어갔을 때 branch가 `main`이라면 상관이 없지만 만약 `master`로 설정이 되어있다면 또 `main` Branch가 없다면 `master` branch의 이름을 `main`으로 바꿔야 합니다.

![repo settings](https://user-images.githubusercontent.com/83404333/135550863-5299a189-5191-46fa-b7e3-e5496658dbfa.png){: .align-center}

자신의 깃헙 리포의 :gear:`Settings`탭에 들어가서

![default branch](https://user-images.githubusercontent.com/83404333/135551194-f62f4efa-e9e9-4902-a11a-bc4c4a1d396e.png)

`Default Branch`에 들어간 후

![image](https://user-images.githubusercontent.com/83404333/135551350-df6207c4-62ff-4dca-a128-145b42bafacc.png)

:pencil2:를 눌러서 `master`을 `main`으로 바꿔줍니다.

> 필자는 이미 Jekyll Action을 이미 적용한 상태이기때문에 기본 branch가 `main`입니다. `master`라고 생각하고 봐주세요 :)

#### 2. Personal access token 생성

![image](https://user-images.githubusercontent.com/83404333/135552579-84c83ce4-5550-474a-8441-50cf4c063eff.png)

깃허브 프로필 설정에 들어갑니다.

![image](https://user-images.githubusercontent.com/83404333/135553311-27a03583-4492-48b2-9cd4-8388a9b98c33.png)

들어간 후에 `Developer settings`에 들어갑니다.

![image](https://user-images.githubusercontent.com/83404333/135553803-7f37e481-6e28-46ff-ad93-4fa85bae5168.png)

들어가서 `Personal access tokens`에 들어간후 `Generate new token`을 눌러서 새로운 토큰을 생성합니다.

![image](https://user-images.githubusercontent.com/83404333/135554076-3c8255bf-03b7-49a4-aa05-d1c9b4f27afa.png)

다음과같이 제목을 설정한후(제목은 딱히 상관이 없어요.)<br>
`Expiration`을 `No expiration`으로 설정해줍니다.<br>
(이렇게 하지않으면 한달에 한번씩 이 작업을 반복해야함;)<br>
`Select scopes`에서 `repo`만 선택후 아래로 내려가서 `Generate token`을 눌러 생성해줍니다.

![image](https://user-images.githubusercontent.com/83404333/135554371-a133556c-c1fb-4073-944f-bcea82e6b9bd.png)

그럼 이렇게 토큰이 생성되는데 ***절대*** 다른사람에게 알려주면 안됩니다. 또 재확인이 불가하므로 메모장같은 곳에 잘 보관해 주세요.

![image](https://user-images.githubusercontent.com/83404333/135554768-f287b0cf-8a6a-4b4e-a3d0-29ea798a60c9.png)

다시 리포의 :gear:`Settings`탭에 들어가서 `Secrests`탭에 들어간후 `New repository secret`를 눌러서 새로운 `secret`을 생성합니다.

![image](https://user-images.githubusercontent.com/83404333/135555572-e8fff5b9-9a0c-486f-a96e-8b6321165bd4.png)

제목(Name)을 `JEKYLL_TOKEN`으로 설정합니다.(중요!!)<br>
내용(Value)을 아까 얻은 토큰을 넣어주면 됩니다.<br>
그후 `Add secret`을 눌러 생성합니다.

#### 3. Jekyll Action용 파일 생성

![image](https://user-images.githubusercontent.com/83404333/135551638-6e4574bb-d376-4671-8e91-1931d468729c.png){: .align-center}

▶`Actions` 탭에 들어간후 <u markdown="1">`set up a workflow yourself`</u> 를 눌러줍니다.

![image](https://user-images.githubusercontent.com/83404333/135551992-a7f1bdb9-52b9-4cb4-a4db-5e76027a63cb.png){: .align-center}

파일의 제목을 `main.yml`로 지정한후 내용을 다음과같이 채워줍니다.

![image](https://user-images.githubusercontent.com/83404333/135552179-83e75a0e-7d32-4707-8e7b-966e8a662372.png)

```yml
name: Build and deploy Jekyll site to GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  github-pages:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: helaili/jekyll-action@v2
        with:
          token: ${% raw %}{{ secrets.JEKYLL_TOKEN }}{% endraw %}
          jekyll-src: / 

```

"token" 부분 안에 `JEKYLL_TOKEN` 은 아까 생성한 `secret`의 제목입니다. 만약에 위의 내용을 바꾸고 싶다면 `secret`의 제목도 바꿔줘야 합니다.

"jekyll-src" 부분은 자신의 jekyll 블로그 위치를 지정합니다.<br>
minimal-mistakes 처럼 /docs에 샘플 블로그가 있는경우 오류가 나므로 꼭 `/`로 지정해야 합니다. 

#### 4. 깃헙 페이지 설정

이제 설정에서 `Pages`를 클릭합니다.

![image](https://user-images.githubusercontent.com/83404333/135557144-5951f58a-d4b4-4fa2-b4ab-332f28bf3055.png)

`Source`설정에서 branch를 `master`로 설정합니다.
그리고 `save`클릭

### 끝.

이렇게 하면 외부 플러그인을 깃헙 블로그에 불러올 수 있습니다.<br>
깃헙 내용을 `push`할때마다 깃헙 블로그 페이지가 재생성 됩니다.
> 만약 블로그의 내용이 많을경우 깃헙 페이지에 적용되는 시간이 꽤 걸립니다.

## 마무리

이상으로 **{{ page.title }}** 포스팅을 마치겠습니다.

❗필자의 경험에서 유추한것이므로 틀리거나 잘 작동하지 않을 수 가 있습니다. 만약 해결 방안을 아신다면 댓글에 알려주세요 ;)
{: .notice--warning}