---
title: "키보드 모양"
date: "2021-09-10"
toc: true
toc_sticky_: true
toc_sticky_: true
categories:
    - HTML&CSS
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
	color: #000; //기본 글자색
	font-family: $monospace; //기본 폰트
	font-weight: bold; //글자 두께
	background: #fff; //배경색

	align-items: center; //중앙정렬
	
	display: inline-block; //배경 분리(중요)
	border: 0em; //테두리
	margin: .1em; //간격
	padding: 0em; //글자 간격
	padding-right: .1em; //글자 간격 오른쪽
	padding-left: .1em; //글자 간격 왼쪽
	box-shadow: 0 0 0 0 #fff, 0 .25em 0 0 #bbb; //그림자(아래에 입체 표현)
	
	cursor: pointer; //마우스 커서 바꾸기
	
	transition: .1s cubic-bezier(0, 0, .8, 1); //애니메이션화 설정
}

.key:active { //눌릴때 애니메이션및 위치조정
	transform: translate(0, .2em); //움직임
	box-shadow: 0 0 0 0 #fff, 0 .05em 0 0 #bbb; //그림자(아래에 입체 표현)
}
```


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
	transform: translate(0, .2em);
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
