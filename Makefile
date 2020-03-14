.PHONY: all clean watch help post

HUGO := hugo

all: build

help:
	@echo "Usage: make <command>"
	@echo "  all     Builds the site"
	@echo "  clean   Cleans all build files"
	@echo "  watch   Runs hugo in watch mode, waiting for changes"
	@echo "  post    Makes a new post"

post:
	$(eval FILENAME := $(shell date "+%Y-%m-%d"))
	$(HUGO) new posts/$(FILENAME).md
	$$EDITOR content/posts/$(FILENAME).md

clean:
	-rm -rf public

watch: clean
	$(HUGO) server --watch --buildDrafts --buildFuture

build: clean
	$(HUGO)

docker: build
	docker build -t bbrks.me .
