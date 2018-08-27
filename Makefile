.PHONY: build
build:
	docker build -t dl .

.PHONY: up
up:
	docker run -it -v $(shell pwd):/usr/src/app dl sh
