# -*- mode: makefile; -*-
all: publish

html:
	@zsh -i -c "org-pages --recursive --html --debug generate"

publish:
	@zsh -i -c "org-pages --recursive --html --debug publish"

clean:
	@zsh -i -c "org-pages clean"
