import java.io.*;

public class Sample {
	public static void main(String[] args) {
		try{
			//
			Reader r = new InputStreamReader(new FileInputStream("./test1.txt"));
        	StandardTokenizerImpl lexer = new StandardTokenizerImpl(r);
        	int return_value = lexer.getNextToken();
        	System.out.println(lexer.yytext());
        	while (return_value != -1) {
        		return_value = lexer.getNextToken();
        		// System.out.println(return_value);
        		System.out.println(lexer.yytext());
        	}
        } catch(Exception e) {
            System.out.println(e);
        }
	}
}