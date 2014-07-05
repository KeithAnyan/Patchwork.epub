
all: Patchwork.epub Patchwork.mobi Patchwork.pdf Patchwork.md

Patchwork.epub: 
	rm -f Patchwork.epub
	zip -X0 Patchwork.epub mimetype
	zip -Xur9D Patchwork.epub META-INF/* OEBPS/*

Patchwork.mobi: Patchwork.epub
	rm -f Patchwork.mobi
	ebook-convert Patchwork.epub Patchwork.mobi

Patchwork.pdf: Patchwork.epub
	rm -f Patchwork.pdf
	ebook-convert Patchwork.epub Patchwork.pdf --embed-all-fonts --margin-left 24 --margin-top 24 --margin-right 24 --margin-bottom 24 --minimum-line-height 160

Patchwork.md: Patchwork.epub
	rm -f Patchwork.md
	ebook-convert Patchwork.epub Patchwork.txt --txt-output-formatting=markdown --keep-links --keep-image-references
	cp -f Patchwork.txt Patchwork.md
	rm -f Patchwork.txt
