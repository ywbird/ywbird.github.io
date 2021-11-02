---
title: "Twemoji 쓰기"
date: "2021-10-12"
toc: true
toc_sticky: true
toc_label: "목차"
categories:
  - Blog
excerpt: "Jekyll에서 Twemoji 사용하기"
---
***

## 만들기

<span class='var'>📝_includes\footer\custom.html</span>에 다음 코드를 추가해 주면 끝!

{% include code title='custom.html' %}
```html
<script src="https://twemoji.maxcdn.com/2/twemoji.min.js"></script>
<script>
	twemoji.parse(document.body, {ext: '.svg', folder: 'svg'});
</script>
```

❗이제는 이모지를 콜론 `:` 으로 감싸면 안됩니다!
그냥 이모지 패널을 `Win`{: .key .sp}+`;`{: .key.h}로 열어서 써주세요!
{: .notice--success}