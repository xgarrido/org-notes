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
	@tar czvf /tmp/org-notes-publish.tar.gz index.html doc
	@git checkout gh-pages
	@tar xzvf /tmp/org-notes-publish.tar.gz
	@find . -name *.*~ | xargs rm
	@git commit -am "update documentation" && git push
	@git checkout master
	@rm -f README.el
	@find doc -name "*.html~" | xargs rm

clean:
	@rm -rf doc index.html
