update: pdf
	pidof mupdf | xargs kill -1

mac: *.ms
	@echo COMPILING $^
	groff -ms -T ps $^ | pstopdf -o out.pdf

pdf: *.ms
	@echo COMPILING $^
	groff -ms -T ps $^ | ps2pdf - out.pdf

simple: *.ms
	@echo COMPILING $^
	groff -ms -T pdf $^ > test.pdf

lint: *.txt
	@echo LINTING $^
	proselint $^

json: *.txt
	@echo JSON LINTING $^
	proselint --json $^ | jq -C -r '.data.errors[]|.line,.severity,.column,.message,.replacements' | paste -s -d'    \n'

#groff -ms in.ms -Tps -dpaper=a4l -P-pa4 -P-l > foo.ps
print: pdf
	lpr -P $P -o media=letter -o sides=two-sided-long-edge -o collate=true out.pdf
