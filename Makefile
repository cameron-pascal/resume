.PHONY: view publish clean

dist/resume.pdf: resume.odt
	libreoffice --headless --convert-to pdf:writer_pdf_Export resume.odt --outdir dist
	mv dist/resume.pdf dist/resume_tmp.pdf
	gs -o dist/resume.pdf -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress dist/resume_tmp.pdf -dEmbedAllFonts=true
	rm dist/resume_tmp.pdf

view: dist/resume.pdf
	xdg-open dist/resume.pdf

publish: dist/resume.pdf
	./publish.sh ~/.secrets/resume_secrets.json dist/resume.pdf https://assets.cameron.dev/resume.pdf

clean:
	rm -r dist
