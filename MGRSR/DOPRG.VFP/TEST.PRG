para x1, x2, x3
do case
	case parameters() = 1
		str = 'x1 = ' + x1
	case parameters() = 2
		str = 'x1 = ' + x1 + ',x2 = ' + x2
	case parameters() = 3		
		str = 'x1 = ' + x1 + ',x2 = ' + x2 + ',x3 = ' + x3
otherw
	str = 'Не передан параметр !'
endcase
wait str window nowait