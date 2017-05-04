.PHONY: all clean implode dist test
SUBDIRECTORIES=examples
AUXFILES=markdown.bbl markdown.cb markdown.cb2 markdown.glo markdown.bbl \
	markdown.run.xml markdown.bib
AUXDIRS=_minted-markdown
TDSARCHIVE=markdown.tds.zip
CTANARCHIVE=markdown.ctan.zip
DISTARCHIVE=markdown.zip
ARCHIVES=$(TDSARCHIVE) $(CTANARCHIVE) $(DISTARCHIVE)
EXAMPLES_RESOURCES=examples/tux.pdf examples/example.md examples/scientists.csv
EXAMPLES_SOURCES=examples/context.tex examples/latex.tex
EXAMPLES=examples/context-mkii.pdf examples/context-mkiv.pdf \
	examples/latex-luatex.pdf examples/latex-pdftex.pdf
TESTS=tests/test.sh tests/support/*.tex tests/templates/*/*.tex.m4 \
	tests/templates/*/COMMANDS.m4 tests/testfiles/*/*.test
MAKES=Makefile $(addsuffix /Makefile, $(SUBDIRECTORIES))
READMES=README.md LICENSE VERSION examples/README.md tests/README.md \
	tests/support/README.md tests/templates/README.md tests/testfiles/README.md \
	tests/templates/*/README.md tests/testfiles/*/README.md
DTXARCHIVE=markdown.dtx
INSTALLER=markdown.ins docstrip.cfg
MANUAL=markdown.pdf
INSTALLABLES=markdown.lua markdown.tex markdown.sty t-markdown.tex
MAKEABLES=$(MANUAL) $(INSTALLABLES) $(EXAMPLES)
RESOURCES=$(MANUAL) $(EXAMPLES_RESOURCES) $(EXAMPLES_SOURCES) $(EXAMPLES) \
	$(MAKES) $(READMES) $(INSTALLER) $(DTXARCHIVE) $(TESTS)
EVERYTHING=$(RESOURCES) $(INSTALLABLES)

# This is the default pseudo-target. It typesets the manual,
# the examples, and extracts the package files.
all: $(MAKEABLES) clean
	for DIR in $(SUBDIRECTORIES); do \
		make -C $$DIR all; done

# This target extracts the source files out of the DTX archive.
$(INSTALLABLES): $(INSTALLER) $(DTXARCHIVE)
	xetex $<

# This target typesets the manual.
$(MANUAL): $(DTXARCHIVE)
	latexmk -pdf $<

# This target typesets the examples.
$(EXAMPLES): $(EXAMPLE_SOURCES) $(INSTALLABLES)
	make -C examples

# This pseudo-target runs all the tests in the `tests/` directory.
test:
	make -C tests

# This pseudo-target produces the distribution archives.
dist: implode
	make $(ARCHIVES) clean

# This target produces the TeX directory structure archive.
$(TDSARCHIVE): $(DTXARCHIVE) $(INSTALLABLES) $(MANUAL)
	@# Installing the macro package.
	mkdir -p tex/generic/markdown tex/luatex/markdown tex/latex/markdown \
		tex/context/third/markdown
	cp markdown.tex tex/generic/markdown/
	cp markdown.lua tex/luatex/markdown/
	cp markdown.sty tex/latex/markdown/
	cp t-markdown.tex tex/context/third/markdown/
	@# Installing the documentation.
	mkdir -p doc/generic/markdown doc/latex/markdown/examples \
		doc/context/third/markdown/examples
	cp $(MANUAL) doc/generic/markdown/
	cp examples/context.tex $(EXAMPLES_RESOURCES) doc/context/third/markdown/examples/
	printf 'To typeset the example, process the file `context.tex` using ConTeXt.\n\n' > \
		doc/context/third/markdown/examples/README.md
	cp examples/latex.tex $(EXAMPLES_RESOURCES) doc/latex/markdown/examples/
	printf 'To typeset the example, process the file `latex.tex` using LaTeX.\n\n' > \
		doc/latex/markdown/examples/README.md
	sed -n '/The file `tux.pdf` contains Tux/,$$p' <examples/README.md | tee -a \
		doc/context/third/markdown/examples/README.md \
		doc/latex/markdown/examples/README.md
	@# Installing the sources.
	mkdir -p source/generic/markdown
	cp $(DTXARCHIVE) $(INSTALLER) source/generic/markdown
	zip -r -v -nw $@ tex source doc 
	rm -rf tex source doc

# This target produces the distribution archive.
$(DISTARCHIVE): $(EVERYTHING) $(TDSARCHIVE)
	ln -s . markdown
	zip -MM -r -v -nw $@ $(addprefix markdown/,$(EVERYTHING)) $(TDSARCHIVE)
	rm markdown

# This target produces the CTAN archive.
$(CTANARCHIVE): $(RESOURCES) $(TDSARCHIVE)
	ln -s . markdown
	zip -MM -r -v -nw $@ $(addprefix markdown/,$(RESOURCES)) $(TDSARCHIVE)
	rm markdown

# This pseudo-target removes any existing auxiliary files and directories.
clean:
	latexmk -c $(DTXARCHIVE)
	rm -f $(AUXFILES)
	rm -rf ${AUXDIRS}

# This pseudo-target removes any makeable files.
implode: clean
	rm -f $(MAKEABLES) $(ARCHIVES)
	for DIR in $(SUBDIRECTORIES); do \
		make -C $$DIR implode; done
