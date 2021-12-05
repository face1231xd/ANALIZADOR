package AS_Y_AL;
import java_cup.runtime.Symbol;
%%
%class Jcup
%type  java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r]+
saltolinea=[\n]+
%{
    private Symbol symbol (int type, Object value){
        return new Symbol (type, yyline, yycolumn, value);
    }
    private Symbol symbol (int type){
        return new Symbol (type, yyline, yycolumn);
    }
%}
%%
{espacio} {/*ignore*/}
("//"(.)*) {/*ignore*/}
{saltolinea} {return new Symbol (sym.SALTOLINEA, yychar, yyline, yytext());}
( "(" ) {return new Symbol (sym.ABREPARE, yychar, yyline, yytext());}
( ")" ) {return new Symbol (sym.CIERRAPARE, yychar, yyline, yytext());}
( "," ) {return new Symbol (sym.COMA, yychar, yyline, yytext());}
( ";" ) {return new Symbol (sym.PUNTO_COMA, yychar, yyline, yytext());}
( "'" ) {return new Symbol (sym.APOSTROFE, yychar, yyline, yytext());}
( "CREATE" | "DROP" | "ALTER" | "TRUNCATE" | "COMMENT" | "RENAME" ) {return new Symbol (sym.DDL, yychar, yyline, yytext());}
( "SELECT" | "SELECT DISTINCT" ) {return new Symbol (sym.DQL, yychar, yyline, yytext());}
( "INSERT" | "UPDATE" | "DELETE" | "LOCK" | "MERGE" ) {return new Symbol (sym.DML, yychar, yyline, yytext());}
( "GRANT" | "REVOKE" ) {return new Symbol (sym.DCL, yychar, yyline, yytext());}
( "COMMIT" | "ROLLBACK" | "SAVEPOINT" | "SET TRANSACTION" ) {return new Symbol (sym.TCL, yychar, yyline, yytext());}
( ">" | "<" | "=" | "<=" | ">=" | "!=" ) {return new Symbol (sym.OPERADOR_COMPARATIVO, yychar, yyline, yytext());}
( "AND" | "OR" | "NOT" ) {return new Symbol (sym.OPERADOR_BOOLEANO, yychar, yyline, yytext());}
( "JOIN" | "UNION" | "ORDER BY" | "GROUP BY" ) {return new Symbol (sym.OPERADOR_LOGICO, yychar, yyline, yytext());}
( "LEFT JOIN" | "RIGHT JOIN" | "INNER JOIN" | "FULL OUTER JOIN" ) {return new Symbol (sym.SQL_JOINS, yychar, yyline, yytext());}
( "WHERE" | "BEGIN" | "END" | "WHILE" | "CASE" ) {return new Symbol (sym.CONDICIONAL, yychar, yyline, yytext());}
( "INTO" | "FROM" | "TABLE" | "ADD" | "REFERENCES" | "FROM" | "TO" | "WITH" | "SESSION" ) {return new Symbol (sym.PALABRA_RESERVADA, yychar, yyline, yytext());}
( "VALUES" ) {return new Symbol (sym.ASIGNACION, yychar, yyline, yytext());}
( "TRAN" ) {return new Symbol (sym.FILTROTRAN, yychar, yyline, yytext());}
( "*" ) {return new Symbol (sym.ALL, yychar, yyline, yytext());}
( "PRIMARY KEY" | "FOREIGN KEY" | "NOT NULL" | " NULL" | "CONSTRAINT" ) {return new Symbol (sym.RESTRICCION, yychar, yyline, yytext());}
( "CHAR" |"VARCHAR2" | "NUMBER" | "TIMESTAMP" | "DOUBLE" | "FLOAT" | "DATE" ) {return new Symbol (sym.TIPO_DATO, yychar, yyline, yytext());}
{L}({L}|"_")* {return new Symbol (sym.IDENTIFICADOR, yychar, yyline, yytext());}
("(-"{D}+")") | {D} {return new Symbol (sym.NUMERO, yychar, yyline, yytext());}
. {return new Symbol (sym.ERROR, yychar, yyline, yytext());}
