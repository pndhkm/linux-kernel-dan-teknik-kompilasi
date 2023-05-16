%token <string> STRING
%token <number> NUMBER
%token IF ELSE WHILE
%token AND OR NOT

%%

statement_list:
    statement
    | statement_list ';' statement
    ;

statement:
    assignment_statement
    | if_statement
    | while_statement
    ;

assignment_statement:
    STRING '=' expression
    ;

if_statement:
    IF '(' condition ')' statement
    | IF '(' condition ')' statement ELSE statement
    ;

while_statement:
    WHILE '(' condition ')' statement
    ;

condition:
    expression '>' expression
    | expression '<' expression
    | expression AND expression
    | expression OR expression
    | NOT expression
    ;

expression:
    NUMBER
    | STRING
    | expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    ;

%%

int main(void) {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
