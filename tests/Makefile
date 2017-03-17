.PHONY: all

# This is the default pseudo-target. It runs all the tests.
all:
	find testfiles/ -type f -name '*.test' | parallel --halt 2 ./test.sh
