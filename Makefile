# -*- mode: makefile; -*-
EMACS=emacs
BATCH=$(EMACS) --batch --no-init-file									\
  --eval "(require 'org)"										\
  --eval "(org-babel-do-load-languages 'org-babel-load-languages					\
        '((sh . t)))"											\
  --eval "(setq org-confirm-babel-evaluate nil)"							\
  --eval "(setq c-standard-font-lock-fontify-region-function 'font-lock-default-fontify-region)"	\
  --eval '(org-babel-tangle-file "./README.org")'							\
  --eval '(org-babel-load-file   "./README.org")'

all: publish

publish:
	@mkdir -p doc/stylesheets
	@$(BATCH) --visit "README.org" --funcall org-notes-publish
	@rm -f README.el
	@find doc -name *.*~ | xargs rm -f
	@tar czvf /tmp/org-notes-publish.tar.gz index.html doc
	@git checkout gh-pages
	@tar xzvf /tmp/org-notes-publish.tar.gz
	@git commit -am "update documentation"
	@git push
	#@git checkout master

clean:
	@rm -rf doc index.html
