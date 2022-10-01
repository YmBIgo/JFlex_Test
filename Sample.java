import java.io.*;

public class Sample {
    public static void main (String[] args) {
        try {
            Reader r = new InputStreamReader(new FileInputStream("./hoge.txt"));
            Yylex lexer = new Yylex(r);
            lexer.yylex();
            lexer.yylex();
            lexer.yylex();
            lexer.yylex();
        } catch(Exception e) {
            System.out.println(e);
        }
    }
}
