

PANDOC_FLAGS = \
               -f markdown \
               -t latex \
               --top-level-division chapter

all: $(patsubst %.md,%.pdf,$(wildcard *.md))
	
%.pdf: %.md
	pandoc $(PANDOC_FLAGS) -o $@ $<

# make watch WATCHMAKE=ece606.pdf
watch:
	ls *.md | entr makelatex $(WATCHMAKE)
	
clean:
	find . -regextype grep -regex '.*/*\.\(aux\|log\|out\|nav\|out\|toc\|vrb\)' -delete
	[ -d auto ] && rm -r auto || exit 0
