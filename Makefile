######################
#      Makefile      #
######################

.PHONY: cv

CV_SRCS = $(shell find . -type f -name '*.tex')

cv: cv.pdf

cv.pdf: cv.tex $(CV_SRCS)
	docker run -i --rm --name latex -v $(PWD):/usr/src/app -w /usr/src/app texlive/texlive:latest xelatex cv.tex $(CV_SRCS) cv.pdf

brief_cv: cv.tex $(CV_SRCS)
	docker run -i --rm --name latex -v $(PWD):/usr/src/app -w /usr/src/app texlive/texlive:latest xelatex brief_cv.tex $(CV_SRCS) brief_cv.pdf

coverletter: coverletter.tex $(CV_SRCS)
	docker run -i --rm --name latex -v $(PWD):/usr/src/app -w /usr/src/app texlive/texlive:latest xelatex coverletter.tex $(CV_SRCS) coverletter.pdf

libretto: libretto.tex $(CV_SRCS)
	docker run -i --rm --name latex -v $(PWD):/usr/src/app -w /usr/src/app texlive/texlive:latest latexmk -pdf -xelatex libretto.tex

clean:
	rm -rf *.pdf *.log
