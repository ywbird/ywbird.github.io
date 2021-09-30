---
title: "Jekyll에서 Twemoji 사용하기"
date: "2021-09-29"
toc: true
toc_sticky_: true
toc_label: "목차"
categories:
    - Blog
excerpt: "Jekyll에서 Twemoji를 사용하는법"
---
***

# 이번 글 망함 ㅎ

글을 힘들게 다 쓰고 드디어 깃허브에 `push`했는데...
깃헙 페이지에서는 플러그인이 작동을 안한다... ㅎ
그래서 결국 `Jekyll`전용 이모지인 `Jemoji`를 설치했다...:anger:

![허탈](https://user-images.githubusercontent.com/83404333/135237577-a4f5ca27-3970-4bcf-ac53-63d92e47f5c9.png)

## Jemoji 테스트

```
:sweat_smile:
```
`:sweat_smile:`
<br>
링크 : 테스트 [:sweat_smile:](#이번-글-망함-ㅎ)

<details markdown="1">
<summary><strong>망한 포스트</strong></summary>

## :question: Twemoji는 무었인가?

Twemoji는 [트위터(Twitter)](https://twitter.com/)에서 만든 이모지입니다.
Twemoji는 오픈소스로 `svg`파일, 소스, `JavaScript`가 공개되어 있습니다.

- [Twemoji 깃헙 리포지스트리](https://github.com/twitter/twemoji)
- [Twemoji 공식 사이트](https://twemoji.twitter.com/)

## :eyes: 미리보기

```markdown
작은거: :‎orange_book‎:

큰거: :‎orange_book‎:{: .large}

매우 큰거: :‎orange_book‎:{: .x-large}
```

:arrow_down:{: .large}<br>
<br>
작은거: :orange_book:
<br>
큰거: :orange_book:{: .large}
<br>
매우 큰거: :orange_book:{: .x-large}

>※ :‎orange_book‎:을 그대로 쓰게되면 플러그인의 HTML 코드가 나와버려서 `:`와 이모지 이름 사이에 공백문자를 넣었습니다.

🧨🎃🎏🎐

:arrow_down: 공백문자 복사
```
‎
```

***


## 적용하기

### :electric_plug: 플러그인

[공식 사이트](https://github.com/JuanitoFatas/jekyll-twemoji)

:page_facing_up:`Gemfile`에 다음 내용을 추가해 줍니다.

```
gem "jekyll-twemoji"
```

<br>
:page_facing_up:`_config.yml`에 다음 내용을 추가해 줍니다.

```yml
gems:
  - jekyll/twemoji
```

> `minimal-mistakes`의 경우에는 `plugins`에 `212줄`~`227줄`위치에 `gems`가 있습니다. (`whitelist`부분에도 추가해야하는듯)
<br>
설정을 위해서는 :page_facing_up:`_config.yml`에 다음 내용을 추가해 줍니다.

```yml
jekyll-twemoji:
  - image_type: "svg" # defaults to "svg"
```

그럼 `jekyll-twemoji`의 공식 문서에서의 설치는 **끝** *인데* 이 상태로 블로그에 적용을 하면!

![wrong](https://user-images.githubusercontent.com/83404333/135213581-2bad049e-5b5b-4428-8e92-46fe127cd69b.png){: width="60%" .outline}<br>
???<br>
이게 ㅁ, 무슨?
이모지가 대빵(?) 만하게 나온다.
추측한 결과 `jekyll-twemoji`의 자체적 에러인걸로...
> 공식 문서에 이모지의 사이즈를 조절할수 있다고 나와있지만 작동하지 않았다...

### :ballot_box_with_check:에러 해결

그래서 생각해낸것이 이 플러그인을 사용하면 이모지의 HTML 태그에 `emoji`클래스가 붙는것을 이용해서...

📁`_sass\mininmal-mistakes` 폴더에 📝`_decorations.scss` 파일을 만듭니다.

내용을 다음과 같이 넣어줍니다.

#### 📝_decorations.scss

```scss
.emoji {
  width: 1em;
  display: inline-block;
}

.emoji.large {
  width: 2em;
  display: inline-block;
}

.emoji.x-large {
  width: 3em;
  display: inline-block;
}
```

그리고 :page_facing_up:`_decorations.scss`를 📁`_sass\minimal-mistakes.scss`에 임포트 해준다.
임포트 하는 방법은 [키보드 모양](/blog/colorful-keys/#minimal-mistakesscss-에-임포트-하기)에서 나와있으니 참고하자.

> 내 [📝_decorations.scss](https://github.com/ywbook/blog/blob/master/_sass/minimal-mistakes/_decorations.scss)

## 사용하기

다음처럼 콜론(`:`)2개 사이에 원하는 이모지의 이름을 넣어서 사용할 수 있습니다.

```
:‎orange_book‎‎:
```

:arrow_down:

:orange_book:

이모지 리스트는 [여기](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)서 찾을 수 있습니다.

기본적으로 이모지의 크기가 `1em`이 입니다.
이모지 뒤에 `{: .large}`를 넣으면 커지고
이모지 뒤에 `{: .x-large}`를 넣으면 **더** 커집니다.

## 마무리

이상으로 **{{ page.title }}** 포스팅을 마치겠습니다.

</details>