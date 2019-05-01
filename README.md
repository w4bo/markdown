Markdown
========
[![release](https://img.shields.io/github/release/witiko/markdown.svg)][release]
[![CircleCI](https://circleci.com/gh/Witiko/markdown/tree/master.svg?style=shield)][CircleCI]

 [CircleCI]: https://circleci.com/gh/Witiko/markdown/tree/master "CircleCI"
 [release]:  https://github.com/Witiko/markdown/releases/latest  "Releases · Witiko/markdown"

The Markdown package converts [markdown][] markup to TeX commands. The
functionality is provided both as a Lua module, and as plain TeX, LaTeX, and
ConTeXt macro packages that can be used to directly typeset TeX documents
containing markdown markup. Unlike other convertors, the Markdown package
does not require any external programs and makes it easy to redefine how each
and every markdown element is rendered. Creative abuse of the markdown syntax
is encouraged. 😉

 [markdown]: https://daringfireball.net/projects/markdown/basics/ "Daring Fireball: Markdown Basics"

Further information
-------------------
For further information, consult one of the following:

1. The [user manual][manual], which can be produced by interpreting the
   `markdown.ins` file using a Unicode-aware TeX engine, such as XeTeX
   (`xetex markdown.ins`) or LuaTeX (`luatex markdown.ins`). The manual will
   reside in the file `markdown.md` and the CSS stylesheet `markdown.css`.
2. The [technical documentation][techdoc], which can be typeset by running the
   [LaTeXMK][] tool on the `markdown.dtx` file
   (`latexmk markdown.dtx`) after [installing the Markdown package][install].
   [LaTeXMK][] should be included in your TeX distribution. The typeset
   documentation will reside in the file `markdown.pdf`.
3. Tutorials and example documents by [Lian Tze Lim][liantze] at [Overleaf][]:
    - [How to write in Markdown on Overleaf][overleaf-1],
    - [Markdown into LaTeX with Style][overleaf-2],
    - [Writing Markdown in LaTeX Documents][overleaf-3],
    - [Writing Beamer Slides with Markdown][overleaf-4],
    - [Writing Posters with Markdown][overleaf-5], and
    - [Using Markdown in LaTeX documents][overleaf-6].
4. My journal articles published by [TUGboat][]:
    - [Using Markdown inside TeX documents][tb119], and
    - [Markdown 2.7.0: Towards lightweight markup in TeX][tb124].

 [overleaf-1]: https://www.overleaf.com/learn/latex/Articles/How_to_write_in_Markdown_on_Overleaf       "How to write in Markdown on Overleaf"
 [overleaf-2]: https://www.overleaf.com/learn/latex/Articles/Markdown_into_LaTeX_with_Style             "Markdown into LaTeX with Style"
 [overleaf-3]: https://www.overleaf.com/learn/how-to/Writing_Markdown_in_LaTeX_Documents                "Writing Markdown in LaTeX Documents"
 [overleaf-4]: https://www.overleaf.com/latex/examples/writing-beamer-slides-with-markdown/dnrwnjrpjjhw "Writing Beamer Slides with Markdown"
 [overleaf-5]: https://www.overleaf.com/latex/examples/writing-posters-with-markdown/jtbgmmgqrqmh       "Writing Posters with Markdown"
 [overleaf-6]: https://www.overleaf.com/latex/examples/using-markdown-in-latex-documents/whdrnpcpnwrm   "Using Markdown in LaTeX documents"

 [tb119]: https://www.tug.org/members/TUGboat/tb38-2/tb119novotny.pdf           "Using Markdown inside TeX documents"
 [tb124]: https://www.tug.org/TUGboat/production/40-1/tb124novotny-markdown.pdf "Markdown 2.7.0: Towards lightweight markup in TeX"

 [install]:  http://mirrors.ctan.org/macros/generic/markdown/markdown.html#installation "Markdown Package User Manual"
 [liantze]:  http://liantze.penguinattack.org/                                          "Rants from the Lab"
 [manual]:   http://mirrors.ctan.org/macros/generic/markdown/markdown.html              "Markdown Package User Manual"
 [overleaf]: https://www.overleaf.com/                                                  "Overleaf: Real-time Collaborative Writing and Publishing Tools with Integrated PDF Preview"
 [techdoc]:  http://mirrors.ctan.org/macros/generic/markdown/markdown.pdf               "A Markdown Interpreter for TeX"
 [tugboat]:  https://www.tug.org/tugboat/                                               "TUGboat - Communications of the TeX Users Group"

Contributing
------------
Apart from the example markdown documents, tests, and continuous integration,
which are placed in the `examples/`, `tests/`, and `.circleci/` directories,
the complete source code and documentation of the package are placed in the
`markdown.dtx` document following the [literate programming][] paradigm.
Some useful commands, such as building the release archives and typesetting
the documentation, are placed in the `Makefile` file for ease of maintenance.

When the file `markdown.ins` is interpreted using a Unicode-aware TeX engine,
such as XeTeX (`xetex markdown.ins`) or LuaTeX (`luatex markdown.ins`), several
files are produced from the `markdown.dtx` document. In `markdown.dtx`, the
boundaries between the produced files are marked up using a XML-like syntax
provided by the [DocStrip][] plain TeX package.

Running the [LaTeXMK][] tool on the `markdown.dtx` file
(`latexmk markdown.dtx`) after the Markdown package has been
[installed][install] typesets the documentation. In `markdown.dtx`, the
documentation is placed inside TeX comments and marked up using the
[ltxdockit][] LaTeX document class. Support for typesetting the documentation
is provided by the [doc][] LaTeX package.

 [doc]:                  https://ctan.org/pkg/doc                           "doc – Format LaTeX documentation"
 [DocStrip]:             https://ctan.org/pkg/docstrip                      "docstrip – Remove comments from file"
 [LaTeXMK]:              https://ctan.org/pkg/latexmk                       "latexmk – Fully automated LaTeX document generation"
 [literate programming]: https://en.wikipedia.org/wiki/Literate_programming "Literate programming"
 [ltxdockit]:            https://ctan.org/pkg/ltxdockit                     "ltxdockit – Documentation support"

Acknowledgements
----------------
I gratefully acknowledge the funding from the [Faculty of Informatics][fimu]
at the [Masaryk University][mu] in Brno, Czech Republic, for the development of
the Markdown package.

Support for content slicing (Lua options `shiftHeadings` and `slice`) and pipe
tables (Lua options `pipeTables` and `tableCaptions`) was graciously sponsored
by [David Vins][dvins] and [Omedym][].

Extensive user documentation of the Markdown package was kindly written by
[Lian Tze Lim][liantze] and published by [Overleaf][].

 [dvins]:  https://github.com/dvins             "David Vins"
 [fimu]:   https://www.fi.muni.cz/index.html.en "Faculty of Informatics, Masaryk University"
 [mu]:     https://www.muni.cz/en               "Masaryk University"
 [Omedym]: https://www.omedym.com/              "Omedym"
