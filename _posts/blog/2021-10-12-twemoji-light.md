---
title: "Twemoji 가볍게!"
date: "2021-10-12"
toc: true
toc_sticky: true
toc_label: "목차"
categories:
  - Blog
unlisted: 1
---
***

이건 Twemoji관련 글이 너무 많아지는것 같아서 리스트에 포함시키지 않았습니다!

## 만들기

<span class='var'>📝_includes\footer\custom.html</span>에 다음 코드를 추가해 주면 끝!

{% include code title='_includes\footer\custom.html' %}
```html
<script src="https://twemoji.maxcdn.com/2/twemoji.min.js"></script>
<script>
	twemoji.parse(document.body);
</script>
```

❗이제는 이모지를 콜론 `:` 으로 감싸면 안됩니다!
{: .notice--warning}