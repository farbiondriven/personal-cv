######################
#      Makefile      #
######################

.PHONY: cv

CV_SRCS = $(shell find -name '*.tex')

cv: cv.pdf

cv.pdf: cv.tex $(CV_SRCS)
	docker run -i --rm --name latex -v $(PWD):/usr/src/app -w /usr/src/app texlive/texlive:latest xelatex cv.tex $(CV_SRCS) cv.pdf

clean:
	rm -rf *.pdf *.log
