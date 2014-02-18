BIN=./node_modules/.bin

MOCHA=$(BIN)/mocha
COFFEE=$(BIN)/coffee

test:
	$(MOCHA) --compilers coffee:coffee-script-redux/register test/_helper.js test/**/*.coffee --reporter spec

assets:
	$(COFFEE) --js <public/javascripts/application.coffee >public/javascripts/application.js

dev:
	bin/devserver

.PHONY: test coffee-to-js dev