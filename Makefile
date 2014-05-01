# -*- mode: makefile; -*-
all: publish

html:
	@zsh -i -c "org-pages --recursive --html --generate-home-link --generate-github-link generate"

publish:
	@zsh -i -c "org-pages --recursive --html --generate-home-link --generate-github-link publish"

clean:
	@zsh -i -c "org-pages clean"
