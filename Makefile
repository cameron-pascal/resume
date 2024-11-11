.PHONY: publish clean

dist/resume.pdf: src/resume.odt
	./build.sh

publish: dist/resume.pdf
	./publish.sh 

clean:
	rm -r dist
