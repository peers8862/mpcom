---
layout: default
nav_exclude: true
title: Posts in "workpads"
categories: workpads
---

<h1>Workpads</h1>
<ul>
  {% for post in site.categories[page.categories] %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      <span>{{ post.date | date: "%B %d, %Y" }}</span>
    </li>
  {% endfor %}
</ul>
