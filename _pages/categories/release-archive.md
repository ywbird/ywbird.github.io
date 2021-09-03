---
title: "리소스팩"
layout: archive
permalink: /release
author_profile: true
sidebar_main: true
---

{% assign posts = site.categories.release %}
{% for post in posts %} {% include archive-single.html type=page.entries_layout %} {% endfor %}