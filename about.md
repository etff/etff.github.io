---
layout: page
title:
permalink: /about/
comment: false
latex: true
---
* TOC
{:toc}

<div class="contact">
{% if site.github_username %}
        <a href="https://github.com/{{ site.github_username }}">GitHub</a>
{% endif %}
{% if site.twitter_username %}
        <a href="https://twitter.com/{{ site.twitter_username }}">Twitter</a>
{% endif %}
{% if site.email %}
        <a href="mailto:{{ site.email }}">Email</a>
{% endif %}
        <a href="{{ "/feed.xml" | prepend: site.baseurl }}">RSS</a>
</div>

## About Me

<!-- TODO: 자기소개를 채워 주세요. -->

* 소프트웨어 개발자입니다.
* 배운 것을 이 위키에 기록합니다.
