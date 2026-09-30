.PHONY: all build clean watch help post docker-build docker-run

HUGO := hugo

all: build

help:
	@echo "Usage: make <command>"
	@echo "  all     Builds the site"
	@echo "  clean   Cleans all build files"
	@echo "  watch   Runs hugo in watch mode, waiting for changes"
	@echo "  post    Makes a new post"
	@echo "  docker-build  Builds the Docker image"
	@echo "  docker-run    Runs the Docker image on http://localhost:8080"

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

docker-build:
	docker build -t bbrks.me .

docker-run: docker-build
	docker run --rm -p 8080:80 bbrks.me
