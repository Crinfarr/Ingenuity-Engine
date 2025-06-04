
HXML_EXTRAS := --debug
HXML_TARGET := js.hxml

# Capital letters are auto targets, lowercase are manual
# Tab separated bc its pretty
.PHONY: DEFAULT	TRYINIT	UPDATE	FULL
.PHONY: prod	hl		js		init

DEFAULT: FULL

init: TRYINIT UPDATE

prod: HXML_EXTRAS :=
prod: FULL

hl: HXML_TARGET := hl.hxml
hl: FULL

js: HXML_TARGET := js.hxml
js: FULL

clean:
	rm bin/js/main.js bin/js/main.js.map

FULL: src/Main.hx src/gamestate/*
	haxe $(HXML_TARGET) $(HXML_EXTRAS)


UPDATE:
	git fetch
	git submodule update --recursive --remote

TRYINIT:
	@git submodule update --init --recursive
	@echo "Using Hashlink $$(hl --version)";
	@if [ ! -d bin ]; then\
		mkdir bin;\
	fi;