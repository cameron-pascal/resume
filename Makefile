.PHONY: publish clean

dist/resume.pdf: src/resume.odt
	./build.sh

publish: dist/resume.pdf
	./publish.sh ~/.secrets/resume_secrets.json dist/resume.pdf https://assets.cameron.dev/resume.pdf

clean:
	rm -r dist
