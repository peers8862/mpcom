---
layout: default
nav_exclude: true
title: Posts in "workwarrior"
category: workwarrior
---

<h1>Workwarrior</h1>
<ul>
  {% for post in site.categories[page.category] %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      <span>{{ post.date | date: "%B %d, %Y" }}</span>
    </li>
  {% endfor %}
</ul>
