cv.pdf: cv.tex

all: cv-pdf resume-pdf

qrcodegithub.pdf: createqr.py
	python createqr.py --outfile qrcodegithub.svg --size 1 http://bit.ly/codedsk
	inkscape -D -z --file=qrcodegithub.svg --export-pdf=qrcodegithub.pdf

qrcoderesume.pdf: createqr.py dk_resume.vcf
	python createqr.py --outfile qrcoderesume.svg --size 1 --infile dk_resume.vcf
	inkscape -D -z --file=qrcoderesume.svg --export-pdf=qrcoderesume.pdf

qrcodecv.pdf: createqr.py dk_cv.vcf
	python createqr.py --outfile qrcodecv.svg --size 1 --infile dk_cv.vcf
	inkscape -D -z --file=qrcodecv.svg --export-pdf=qrcodecv.pdf

cv.pdf: qrcodecv.pdf cv.tex
	texi2pdf cv.tex
	texi2pdf cv.tex
	texi2pdf cv.tex

cv-pdf: cv.pdf
	cp cv.pdf dsk_cv_`date "+%Y%m%d"`.pdf

resume.pdf: qrcoderesume.pdf resume.tex
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
           cv.out resume.out

distclean: clean
	rm -rf cv.pdf resume.pdf \
           codedskgithub.svg codedskgithub.pdf \
           qrcodecv.svg qrcodecv.pdf \
           qrcoderesume.svg qrcoderesume.pdf
