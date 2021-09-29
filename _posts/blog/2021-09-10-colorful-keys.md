---
title: "키보드 모양"
date: "2021-09-10"
toc: true
toc_sticky_: true
toc_label: 목차
categories:
    - Blog
excerpt: "키보드 모양 CSS로 만들기"
---
***
그냥 블로그 꾸미다가 필요해서 추가하게 됐다.

# 소개

`A`{: .key} ⬅대충 이런 거. **누를 수도 있다!**

## 만들기

먼저 📁`_sass\mininmal-mistakes` 폴더에 📝`_keys.scss` 파일을 만듭니다.
다음 내용을 작성합니다.

### 📄_keys.scss

```css
// Keys

.key {
	color: #000;
	font-family: $monospace;
	font-weight: bold;
	background: #fff;

	align-items: center;
	
	display: inline-block;
	border: 0em;
	margin: .1em;
	padding: 0em;
	padding-right: .1em;
	padding-left: .1em;
	box-shadow: 0 0 0 0 #fff, 0 .25em 0 0 #bbb;
	
	cursor: pointer;
	
	transition: .1s cubic-bezier(0, 0, .8, 1);
}

.key:active {
	top: 2em;
	box-shadow: 0 0 0 0 #fff, 0 .05em 0 0 #bbb;
}
```

### 📄minimal-mistakes.scss 에 임포트 하기

그후 📁`_sass` 폴더에 📄`minimal-mistakes.scss` 파일을 열고 마지막줄에 다음 내용을 입력합니다.

```css
/* Custom classes */
@import "minimal-mistakes/keys";
```

## 적용

그런후 원하는 글자를 강조표시 뒤에 `{: .key}` 를 붙이면 됩니다.
```
`글자`{: .key}
```

`글자`{: .key}

### 예

Win + E 를 쓰고싶으면

```
`Win`{: .key}+`E`{: .key}
```
`Win`{: .key}+`E`{: .key}

***

Ctrl + W 를 쓰고싶으면

```
`Ctrl`{: .key}+`W`{: .key}
```
`Ctrl`{: .key}+`W`{: .key}

## 응용

이를 응용해서 특수키를 만들 수 있다.

`Win`{: .key} 등 특수키를 노란색으로 바꿔보자.

### 📄_keys.scss 에 추가

```css

//special

.key.sp {
	color: #000;
	font-family: $monospace;
	font-weight: bold;
	background: #fff6a8;

	align-items: center;
	
	display: inline-block;
	border: 0em;
	margin: .1em;
	padding: 0em;
	padding-right: .1em;
	padding-left: .1em;
	box-shadow: 0 0 0 0 #fff6a8, 0 .25em 0 0 #a89f6b;
	
	cursor: pointer;
	
	transition: .1s cubic-bezier(0, 0, .8, 1);
}

.key.sp:active {
        top: 2em;
	box-shadow: 0 0 0 0 #fff6a8, 0 .05em 0 0 #a89f6b;
}
```

그리고

```
`Win`{: .key .sp} + `R`{: .key}
```
하면...

`Win`{: .key .sp} + `R`{: .key}

짠! 완성이다.
