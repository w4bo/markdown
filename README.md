# About #

The Markdown package provides facilities for the conversion of markdown markup
to plain TeX. These are provided both in the form of a Lua module and in the
form of plain TeX, LateX, and ConTeXt macro packages that enable the direct
inclusion of markdown documents inside TeX documents.

This material is subject to the LaTeX Project Public License.

# Installation #

To install the package, interpret the `markdown.ins` file using a Unicode-aware
TeX engine, such as XeTeX (`xetex markdown.ins`) or LuaTeX
(`luatex markdown.ins`). This should produce the following files:

 * `markdown.lua` -- The Lua module
 * `markdown-cli.lua` -- The Lua command-line interface
 * `markdown.tex` -- The plain TeX macro package
 * `markdown.sty` -- The LaTeX package
 * `t-markdown.tex` -- The ConTeXt module

## Local installation ##

To perform a local installation, place these files into your TeX directory
structure. This is generally where the individual files should be placed:

 * `<TEXMF>/tex/luatex/markdown/markdown.lua`
 * `<TEXMF>/scripts/markdown/markdown-cli.lua`
 * `<TEXMF>/tex/generic/markdown/markdown.tex`
 * `<TEXMF>/tex/latex/markdown/markdown.sty`
 * `<TEXMF>/tex/context/third/markdown/t-markdown.tex`

where `<TEXMF>` corresponds to a root of your TeX distribution, such as
`/usr/share/texmf` and `~/texmf` on UN\*X systems or
`c:\users\<YOUR USERNAME>\texmfhome` on Windows systems. When in doubt,
consult the manual of your TeX distribution.

## Portable installation ##

Alternatively, you can also store the `markdown.lua`, `markdown-cli.lua`,
`markdown.tex`, `markdown.sty` and `t-markdown.tex` in the same folder as your
TeX document and distribute them together. This way your document can be
portably typeset on legacy TeX distributions.

# Contributing #

Apart from the example markdown documents and tests, which are placed in the
`examples/` and `tests/` directories, the complete source code and
documentation of the package are placed in the `markdown.dtx` document,
following the literate programming paradigm.

When the file `markdown.ins` is interpreted using a Unicode-aware TeX engine,
such as XeTeX (`xetex markdown.ins`) or LuaTeX (`luatex markdown.ins`), several
files are produced from the `markdown.dtx` document. In `markdown.dtx`, the
boundaries between the produced files are marked up using a XML-like syntax
provided by the [DocStrip][] plain TeX package.

Running the [LaTeXMK][LaTeXMK] tool on the `markdown.dtx` file
(`latexmk -pdf markdown.dtx`) typesets the documentation. In `markdown.dtx`,
the documentation is placed inside TeX comments and marked up using the
[ltxdockit][] LaTeX document class. Support for typesetting the documentation
is provided by the [doc][] LaTeX package.

 [DocStrip]:  https://ctan.org/pkg/docstrip   (docstrip – Remove comments from file)
 [LaTeXMK]:   https://ctan.org/pkg/latexmk    (latexmk – Fully automated LaTeX document generation)
 [ltxdockit]: https://ctan.org/pkg/ltxdockit  (ltxdockit – Documentation support)
 [doc]:       https://ctan.org/pkg/doc        (doc – Format LaTeX documentation)

# Further information #

For further information, consult:

1. the technical documentation, which can be typeset by running the
   [LaTeXMK][LaTeXMK] tool on the `markdown.dtx` file
   (`latexmk -pdf markdown.dtx`). [LaTeXMK][LaTeXMK] should be included in your
   TeX distribution. The typeset documentation will reside in the file
   `markdown.pdf`, and
2. the user manual, which can be produced by interpreting the `markdown.ins`
   file using a Unicode-aware TeX engine, such as XeTeX (`xetex markdown.ins`)
   or LuaTeX (`luatex markdown.ins`). The manual will reside in the file
   `markdown.md`.
