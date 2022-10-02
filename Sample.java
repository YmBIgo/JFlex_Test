import java.io.*;
import java.util.ArrayList;

public class Sample {
    public static void main (String[] args) {
        try {
            Reader r = new InputStreamReader(new FileInputStream("./hoge.txt"));
            Yylex lexer = new Yylex(r);
            lexer.yylex();
            lexer.yylex();
            lexer.yylex();
            lexer.yylex();
            ArrayList<ArrayList<String>> lexer_result = lexer.return_result();
            // System.out.println(lexer_result.get(0));
            for (int i = 0; i < lexer_result.size(); i++) {
                System.out.println(lexer_result.get(i));
            }
        } catch(Exception e) {
            System.out.println(e);
        }
    }
}
