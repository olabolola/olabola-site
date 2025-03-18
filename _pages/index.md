---
layout: page
title: Home
id: home
permalink: /
---

# Welcome!

<strong>Topics</strong>

<div class="topics-cloud">
{% assign all_topics = '' | split: '' %}
{% for note in site.notes %}
  {% if note.labels %}
    {% for label in note.labels %}
      {% if label contains '[' %}
        {% assign topic = label | split: ']' | first | remove: '[' | downcase %}
        {% assign all_topics = all_topics | push: topic %}
      {% endif %}
    {% endfor %}
  {% endif %}
{% endfor %}
{% assign unique_topics = all_topics | uniq | sort %}
{% for topic in unique_topics %}
  <a href="{{ site.baseurl }}/topics/{{ topic | slugify }}" class="topic-link">{{ topic }}</a>
{% endfor %}
</div>

<strong>Recent Notes</strong>

<ul class="notes-list">
  {% assign recent_notes = site.notes | sort: "created" | reverse %}
  {% for note in recent_notes limit: 100 %}
    <li>
      {{ note.created | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

<style>
  .wrapper {
    max-width: 46em;
  }
  
  .topics-cloud {
    margin: 1em 0 2em 0;
    line-height: 2em;
  }
  
  .topic-link {
    display: inline-block;
    margin-right: 1em;
    text-decoration: none !important;
    color: #555;
    font-size: 0.95em;
  }
  
  .topic-link:hover {
    color: #000;
    text-decoration: underline !important;
  }
  
  .notes-list {
    margin-bottom: 3em;
  }
  
  .note-topics {
    margin-left: 0.5em;
  }
  
  .topic-tag {
    font-size: 0.85em;
    color: #555;
    text-decoration: none !important;
    margin-left: 0.5em;
  }
  
  .topic-tag:before {
    content: '#';
    opacity: 0.5;
  }
  
  .topic-tag:hover {
    color: #000;
    text-decoration: underline !important;
  }
</style>
