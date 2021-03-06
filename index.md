---
---
[![header]](images/header-full.jpg)

# {{ site.title | xml_escape }}

The Security & Privacy group consists of researchers in the [Department of
Computer Science](https://www.cs.uic.edu) at the [University of Illinois at
Chicago](https://www.uic.edu). Our group performs research into a wide range
of security and privacy topics including formal methods, theoretical and
applied cryptography, web security and privacy, systems and network security,
language-based security, computer security education, and computer security
policy. We are affiliated with the [Systems & Internet Security
Lab](https://sisl.rites.uic.edu), the [BITS
Lab](https://www.cs.uic.edu/bin/view/Bits/WebHome), and the [Ethos
Lab](https://www.ethos-os.org/).


<nav class="menu" markdown="1">
- [People](#faculty)
- [Publications](#recent-publications)
- [Sponsors](#sponsors)
</nav>

## Faculty
- [Daniel J. Bernstein](https://cr.yp.to/djb.html)
- [Stephen Checkoway](https://www.cs.uic.edu/~s/)
- [Chris Kanich](https://www.cs.uic.edu/~ckanich/)
- [Jason Polakis](https://www.cs.uic.edu/~polakis/)
- [Prasad Sistla](https://www.cs.uic.edu/Sistla)
- [Robert Sloan](https://www.cs.uic.edu/Sloan)
- [Jon A. Solworth](https://www.ethos-os.org/~solworth/)
- [Cynthia Taylor](https://www.cs.uic.edu/~cynthiat/)
- [V.N. Venkatakrishnan](https://www.cs.uic.edu/~venkat/)
- [Elena Zheleva](https://www.cs.uic.edu/~elena/)
- [Lenore Zuck](https://www.cs.uic.edu/~lenore/)
{:.thinlist}

## Postdocs
- [Birhanu Eshete](https://www.cs.uic.edu/~beshete/)
- [Rigel Gjomemo](http://securityigert.uic.edu/People/staff/Rigel)
{:.thinlist}

## Ph.D. Students
- Abeer Alhuzali
- [Sara Amini](https://www.cs.uic.edu/~samini/)
- [Mohammad Ghasemisharif](https://www.cs.uic.edu/~mghasemi/)
- [Mohammad Taha Khan](https://www.cs.uic.edu/~taha/)
- [John Kristoff](https://aharp.iorc.depaul.edu/)
- Sadegh Momemi
- Maliheh Monshizadeh
- [Peter Snyder](https://www.cs.uic.edu/~psnyder/)
{:.thinlist}

## M.S. Students
- Vijay Sai Prasanth Kommini
{:.thinlist}

{% assign yr = site.time | date: '%Y' | minus: 2 %}

## Recent Alumni
{%- assign years = site.data.alumni | where_exp: "alum", "alum.year >= yr" | group_by: "year" -%}
{% for year in years %}
{%- assign sorted = year.items | sort: "name" -%}
{% for alum in sorted %}
- {{ alum.name }} ({{ alum.degree }} {{ alum.year }}){% if alum.job %} → {{ alum.job }}{% endif -%}
{%- endfor -%}
{% endfor %}

[[All Alumni]](alumni/)

## Recent Publications
{% bibliography --group_by none --query @*[year >= {{ yr }}] --max 16 %}
{: .spaced }

[[All Publications]](pubs/)

## Sponsors
![National Science Foundation](images/logo-nsf.gif "National Science Foundation")
![Defense Advanced Research Projects Agency](images/logo-darpa.gif "Defense Advanced Research Projects Agency")

[header]: images/header.jpg "Chicago"
