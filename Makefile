RUBY        ?= ruby
RDOC        ?= rdoc
BUNDLE      ?= bundle
RAKE        ?= rake
GEM         ?= gem


help: Makefile
	@echo
	@echo " Choose a command run in Scone:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


## docs: Generate Docs
.PHONY: doc
doc:
	@echo ">> ============= Generate Docs ============= <<"
	$(RDOC)


## test: Run test cases
.PHONY: test
test:
	@echo ">> ============= Run Tests ============= <<"
	$(RAKE) spec


## console: Run interactive console.
.PHONY: console
console:
	@echo ">> ============= Run Console ============= <<"
	./bin/console


## build: Build the ruby gem.
.PHONY: build
build:
	@echo ">> ============= Build the Package ============= <<"
	$(GEM) build scone.gemspec


## push: Publish the ruby gem.
.PHONY: push
push:
	@echo ">> ============= Publish the Package ============= <<"
	$(GEM) push scone-*.gem


## ci: Run all CI tests.
.PHONY: ci
ci: test
	@echo "\n==> All quality checks passed"


.PHONY: help
