---
layout: default
title: Updates
permalink: /updates/
---

<div class="home-columns">
  <!-- Left Column: Raw List of Posts -->
  <div class="column-left">
    <div class="home">
      <h2>Updates</h2>
      <ul>
        {% for post in site.posts limit:300 %}
          <li>
            <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
            <span>{{ post.date | date: "%B %d, %Y" }}</span>
          </li>
        {% endfor %}
      </ul>
      <p class="rss-subscribe">Subscribe <a href="{{ "/feed.xml" | relative_url }}">via RSS</a></p>

      <!-- Pagination Controls -->
      <div class="pagination">
        {% if paginator.previous_page %}
          <a href="{{ paginator.previous_page_path | relative_url }}">← Previous</a>
        {% endif %}
        
        {% if paginator.next_page %}
          <a href="{{ paginator.next_page_path | relative_url }}">Next →</a>
        {% endif %}
      </div>
    </div>
  </div>

  <!-- Right Column: Categories -->
  <div class="column-right">
    <h2>Categories</h2>
    <ul>
      {% for category in site.categories %}
        <li>
          <a href="{{ site.baseurl }}/categories/{{ category[0] | slugify: 'default' }}/">
            {{ category[0] }} ({{ category[1].size }})
          </a>
        </li>
      {% endfor %}
    </ul>
  </div>
</div>