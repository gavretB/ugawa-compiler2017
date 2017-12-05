// antlr4 -package parser -o antlr-generated  -no-listener parser/TinyPiE.g4
grammar TinyPiE;

expr: orExpr
      ;
      
orExpr: orExpr OROP andExpr
	| andExpr
	;
	
andExpr: andExpr ANDOP addExpr
	| addExpr
	;

addExpr: addExpr (ADDOP | SUBOP) mulExpr
	| mulExpr
	;

mulExpr: mulExpr MULOP unaryExpr
	| unaryExpr
	;

unaryExpr: SUBOP unaryExpr				# subExpr
	|VALUE			# literalExpr
	| IDENTIFIER			# varExpr
	| '(' expr ')'			# parenExpr
	| NOTOP unaryExpr				# notExpr
	;

	
ADDOP: '+';
MULOP: '*'|'/';
ANDOP: '&';
OROP:	'|';
NOTOP: '~';
SUBOP: '-';

IDENTIFIER: 'x'|'y'|'z';
VALUE: [1-9][0-9]*;
WS: [ \t\r\n] -> skip;
