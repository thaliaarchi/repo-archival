# HaPyLi notes

## HTML site

- SVN `last_mod_time`s of tutorial:
  - 2010-05-19 05:48:26.734 +0000 Tutorials/web/Functions.html
  - 2010-05-19 05:50:11.218 +0000 Tutorials/web/Variables.html
  - 2010-05-19 05:52:27.968 +0000 Tutorials/web/Expressions.html
  - 2010-05-19 05:54:48.609 +0000 Tutorials/web/Assembler.html
  - 2010-05-22 02:08:24.546 +0000 Tutorials/web/index.html
- Comparison:
  - Identical aside from `#content` and differences here
  - Main `<h1> heading:
    - Assembler, Expressions, Functions, and Variables: `HaPyLi Tutorial`
    - index: `The HaPyLi Programming Language`
  - `#menu`:
    - index: prepends `<li><a href="Introduction.html">Introduction</a></li>`
  - Expressions has two more LF at end
  - Variables has no trailing spaces on line after closing `#content`
- Problems:
  - `#menu` has an extra `</ul>`
  - `<title>` is in `<body>`
  - Make the current page in the nav be bold
  - Make forums link be `https://web.archive.org/web/20120712024855/http://hapyli.webs.com:80/apps/forums/`
    and fix CompSoc link
  - Center the footer
  - Add `li pre { margin: 0; }`
  - Expressions#"String Literals" has a paragraph indented too much
  - Variables#"Local Variables As Pointers" casing
  - Tutorials -> Tutorial
  - Examples `<title>` order

## Webs site

- Comparison:
  - Identical aside from `#fw-bigcontain` and differences here
  - `<title>`:
    - index: `The HaPyLi Programming Language - Home`
    - Functions: `The HaPyLi Programming Language - Functions`
    - Expressions: `The HaPyLi Programming Language - Expressions`
    - Variables: `The HaPyLi Programming Language - Variables and the Heap`
    - Assembler: `The HaPyLi Programming Language - Embedding Whitespace`
    - Examples: `Examples - The HaPyLi Programming Language`
  - `meta[property="og:title"]`:
    - index: `Home`
    - Functions: `Functions`
    - Expressions: `Expressions`
    - Variables: `Variables and the Heap`
    - Assembler: `Embedding Whitespace`
    - Examples: `Examples`
  - `#fw-nav-menu`:
    - index: index has additional `.fw-current-nav-link`
    - Examples: Examples has additional `.fw-current-nav-link`
  - Examples: looks to be created later and has markup differences, but no
    textual differences
- The styles were not archived (http://hapyli.webs.com/.design.css?r=246)
- All pages have exactly the same sidebar (`#fw-sidebar`); cleaned it is:

```html
<aside>
  <h3>Tutorial</h3>
  <ol>
    <li><a href="http://hapyli.webs.com/functions.htm">Functions</a></li>
    <li><a href="http://hapyli.webs.com/expressions.htm">Expressions</a></li>
    <li><a href="http://hapyli.webs.com/variablesandtheheap.htm">Variables and the Heap</a></li>
    <li><a href="http://hapyli.webs.com/embeddingwhitespace.htm">Embedding Whitespace</a></li>
  </ol>

  <h3><a href="http://hapyli.webs.com/apps/forums/">Recent Forum Posts</a></h3>
  <p><i>No recent posts</i></p>
<aside>
```
