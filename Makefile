# -*- mode: makefile; -*-
all: publish

html:
	@zsh -i -c "org-pages --recursive --html --debug generate"

publish: html
	@mkdir -p doc/stylesheets
	@find doc -name *.*~ | xargs rm -f
	@tar czvf /tmp/org-notes-publish.tar.gz index.html doc
	@git checkout gh-pages
	@tar xzvf /tmp/org-notes-publish.tar.gz
	@if [ -n "`git status --porcelain`" ]; then git commit -am "update doc" && git push; fi
	@git checkout master

clean:
	@rm -rf doc index.html
