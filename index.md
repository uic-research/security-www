---
---
[![header]](images/header-full.jpg)

# {{ site.title }}

Here's some fun information about the Security & Privacy group at UIC.

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
- [Lenore Zuck](https://www.cs.uic.edu/~lenore/)

## Postdocs
- [Birhanu Eshete](https://www.cs.uic.edu/~beshete/)
- [Rigel Gjomemo](http://securityigert.uic.edu/People/staff/Rigel)

## Ph.D. Students
- Abeer Alhuzali
- [Sara Amini](https://www.cs.uic.edu/~samini/)
- [Mohammad Ghasemisharif](https://www.cs.uic.edu/~mghasemi/)
- [Mohammad Taha Khan](https://www.cs.uic.edu/~taha/)
- [John Kristoff](https://aharp.iorc.depaul.edu/)
- Sadegh Momemi
- Maliheh Monshizadeh
- [Peter Snyder](https://www.cs.uic.edu/~psnyder/)
- ...

## M.S. Students
- Vijay Sai Prasanth Kommini
- ...

## Recent Alumni
- Arun Swarnam (M.S. 2017) → Applied Materials
- ...

## Recent Publications
{% assign yr = site.time | date: '%Y' | minus: 2 %}
{% bibliography --group_by none --query @*[year >= {{ yr }}] --max 16 %}
{: .spaced }

[[All Publications]](pubs/)

## Sponsors
![National Science Foundation](images/logo-nsf.gif "National Science Foundation")
![Defense Advanced Research Projects Agency](images/logo-darpa.gif "Defense
Advanced Research Projects Agency")

[header]: images/header.jpg "Chicago"
{: width="100%"}
