---
title: "카테고리"
layout: categories
permalink: /categories/
author_profile: true
---
{% assign posts = site.categories[0] %} {% for post in posts %} {% include archive-single2.html type=page.entries_layout %} {% endfor %}