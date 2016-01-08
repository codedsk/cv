cv.pdf: cv.tex

all: cv-pdf resume-pdf

codedskgithub.pdf:
	python createqr.py --outfile codedskgithub.svg --size 2 http://bit.ly/codedsk
	inkscape -D -z --file=codedskgithub.svg --export-pdf=codedskgithub.pdf

cv.pdf: codedskgithub.pdf
	texi2pdf cv.tex
	texi2pdf cv.tex
	texi2pdf cv.tex

cv-pdf: cv.pdf
	cp cv.pdf dsk_cv_`date "+%Y%m%d"`.pdf

resume.pdf: codedskgithub.pdf
	texi2pdf resume.tex
	texi2pdf resume.tex
	texi2pdf resume.tex

resume-pdf: resume.pdf
	cp resume.pdf dsk_resume_`date "+%Y%m%d"`.pdf

#spellcheck:
#	for i in *.tex; do aspell --mode=tex -c ${i}; done

clean:
	rm -rf *.aux *.log *-converted-to.pdf \
           cv.bib resume.bib \
           cv.dvi resume.dvi \
           cv.out resume.out \

distclean: clean
	rm -rf cv.pdf resume.pdf codedskgithub.svg codedskgithub.pdf
