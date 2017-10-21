---
title: All Security and Privacy Alumni
description: "A list of all of UIC's security & privacy alumni"
permalink: /alumni/
---
# {{ page.title }}

{% assign years = site.data.alumni | group_by: "year" %}
{% for year in years %}
## {{ year.name }}
{% assign sorted = year.items | sort: "name" %}
{% for alum in sorted %}
- {{ alum.name }}, {{ alum.degree }}{% if alum.job %} → {{ alum.job }}{% endif %}
{% endfor %}

{% endfor %}
