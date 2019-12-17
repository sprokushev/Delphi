para x1, x2, x3
do case
	case parameters() = 1
		str = 'x1 = ' + x1
	case parameters() = 2
		str = 'x1 = ' + x1 + ',x2 = ' + x2
	case parameters() = 3		
		str = 'x1 = ' + x1 + ',x2 = ' + x2 + ',x3 = ' + x3
otherw
	str = 'No parameters found !'
endcase

*wait str window

SET PRINT TO C:\TMP\123.TXT
SET PRINT ON
? 'PPPP133'
SET PRIN OFF
SET PRINT TO
