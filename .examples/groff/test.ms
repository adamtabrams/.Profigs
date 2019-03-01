.ds CH
.TL
Cheatsheet
.AU
Adam
.ND
.NH
Numbered heading
.NH 2
More numbered heading
.NH 2
Numbered heading
.NH 3
Numbered heading
.SH
Simple heading
.SH
Simple
heading

Another simple heading
.PP
Indented paragraph.
Same Line.

Same .PP, new paragraph, no indent.

Below, extra space.


.LP
New paragraph, no indent.

This is normal text.

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

Here's an image

convert pic.png eps2:pic.eps
.PSPIC -R prob3.eps 3

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
