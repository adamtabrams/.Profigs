.ds CH
.ds RF %
.nr HY 0
.nr PD 0
.nr PS 12
.nr LL 6.5i
.nr HM 1i
.TL
Title
.AU
Author
.ND
.NH
Numbered heading
.NH 2
2-Tier numbered heading
.NH 3
3-Tier numbered heading
.SH
Simple heading

Another simple heading
.PP
Indented paragraph
Same Line.

Same .PP, new paragraph, no indent.

Below, extra space.


.LP
New paragraph, no indent.

This
.B "bold" " text!" "is "

.UL "Underline" !

.I "Italics"

An en-dash \[en] like this.
An em-dash\[em]like that.

.de BL
.IP \(bu 2
..

.IP \(bu 2
This is a bullet.
.BL
This is another bullet.
.ID 10
Custom indenting
.DE
.CD
Centered
.RD
Right aligned
.DE

Break page after this.
.bp

For an image:
convert pic.png eps2:pic.eps

".PSPIC [-L|-R|-C|-I n] file [width [height]]"

.LP
Compile groffs with images with
groff -ms test.ms -T ps | ps2pdf - test.pdf

And simpler groffs with
groff -ms test.ms -T pdf > test.pdf


Footnotes\*{1\*}.

Footnotes\*{2\*}.

Footnotes\*{3\*}.

.FS 1
This should be the first footnote.
.FE
.FS \*{2\*}
This should be the first footnote.
.FE
.FS 3
This should be the first footnote.
.FE
