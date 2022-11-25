---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---
{% for post in site.posts %}
  <div>
    <hr />
    <h2>
      <a href="{{ post.url }}"> {{ post.title }} </a>
    </h2>
    <p>
      <em>{{ post.date | date: "%A, %B %d, %Y" }}</em>
    </p>
    {{ post.content }}
    <br />
  </div>
{% endfor %}

