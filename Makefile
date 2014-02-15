BIN=./node_modules/.bin

MOCHA=$(BIN)/mocha

test:
	$(MOCHA) --compilers coffee:coffee-script-redux/register test/_helper.js test/**/*.coffee --reporter spec

.PHONY: test