mkdir -p temp
libreoffice --headless --convert-to pdf:writer_pdf_Export /input/resume.odt --outdir temp 
gs -o /output/resume.pdf -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress temp/resume.pdf -dEmbedAllFonts=true
