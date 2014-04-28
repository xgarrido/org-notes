# -*- mode: makefile; -*-
all: publish

html:
	@zsh -i -c "org-pages --recursive --html --debug --generate-home-link generate"

publish:
	@zsh -i -c "org-pages --recursive --html --debug --generate-home-link publish"

clean:
	@zsh -i -c "org-pages clean"
