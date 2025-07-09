---
layout: default
nav_exclude: true
title: Posts in "projects"
categories: projects
---

<h1>Projects</h1>
<ul>
  {% for post in site.categories[page.categories] %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      <span>{{ post.date | date: "%B %d, %Y" }}</span>
    </li>
  {% endfor %}
</ul>
