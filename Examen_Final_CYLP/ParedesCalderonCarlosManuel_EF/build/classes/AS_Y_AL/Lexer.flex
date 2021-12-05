package AS_Y_AL;
import static AS_Y_AL.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z]+
D=[0-9]+
espacio=[ \t\r]+
saltolinea=[\n]+
%{
public String lexeme;
%}
%% 
{espacio} {/*ignore*/}
("//"(.)*) {/*ignore*/}
{saltolinea} {return SALTOLINEA;}  
( "(" ) {lexeme=yytext(); return ABREPARE;}        
( ")" ) {lexeme=yytext(); return CIERRAPARE;} 
( "," ) {lexeme=yytext(); return COMA;}
( ";" ) {lexeme=yytext(); return PUNTO_COMA;}
( "'" ) {lexeme=yytext(); return APOSTROFE;}  
( "CREATE" | "DROP" | "ALTER" | "TRUNCATE" | "COMMENT" | "RENAME" ) {lexeme=yytext(); return DDL;}
( "SELECT" | "SELECT DISTINCT" ) {lexeme=yytext(); return DQL;}
( "INSERT" | "UPDATE" | "DELETE" | "LOCK" | "MERGE" ) {lexeme=yytext(); return DML;}
( "GRANT" | "REVOKE" ) {lexeme=yytext(); return DCL;}
( "COMMIT" | "ROLLBACK" | "SAVEPOINT" | "SET TRANSACTION" ) {lexeme=yytext(); return TCL;}
( ">" | "<" | "=" | "<=" | ">=" | "!=" ) {lexeme = yytext(); return OPERADOR_COMPARATIVO;}     
( "AND" | "OR" | "NOT" ) {lexeme = yytext(); return OPERADOR_BOOLEANO;}
( "JOIN" | "UNION" | "ORDER BY" | "GROUP BY" ) {lexeme = yytext(); return OPERADOR_LOGICO;}
( "LEFT JOIN" | "RIGHT JOIN" | "INNER JOIN" | "FULL OUTER JOIN" ) {lexeme = yytext(); return SQL_JOINS;}
( "WHERE" | "BEGIN" | "END" | "WHILE" | "CASE" ) {lexeme = yytext(); return CONDICIONAL;} 
( "INTO" | "FROM" | "TABLE" | "ADD" | "REFERENCES" | "FROM" | "TO" | "WITH" | "SESSION" ) {lexeme = yytext(); return PALABRA_RESERVADA;} 
( "VALUES" ) {lexeme = yytext(); return ASIGNACION;} 
( "TRAN" ) {lexeme = yytext(); return FILTROTRAN;}
( "*" ) {lexeme = yytext(); return ALL;}
( "PRIMARY KEY" | "FOREIGN KEY" | "NOT NULL" |" NULL" | "CONSTRAINT" ) {lexeme = yytext(); return RESTRICCION;}
( "CHAR" |"VARCHAR2" | "NUMBER" | "TIMESTAMP" | "DOUBLE" | "FLOAT" | "DATE" ) {lexeme = yytext(); return TIPO_DATO;} 
{L}({L}|"_")* {lexeme=yytext(); return IDENTIFICADOR;}
("(-"{D}+")") | {D} {lexeme=yytext(); return NUMERO;}
. {return ERROR;}
