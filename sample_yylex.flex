/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright (C) 2000 Gerwin Klein <lsf@jflex.de>                          *
 * All rights reserved.                                                    *
 *                                                                         *
 * Thanks to Larry Bell and Bob Jamison for suggestions and comments.      *
 *                                                                         *
 * This program is free software; you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License. See the file      *
 * COPYRIGHT for more information.                                         *
 *                                                                         *
 * This program is distributed in the hope that it will be useful,         *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 * GNU General Public License for more details.                            *
 *                                                                         *
 * You should have received a copy of the GNU General Public License along *
 * with this program; if not, write to the Free Software Foundation, Inc., *
 * 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA                 *
 *                                                                         *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

import java.util.ArrayList;

%%

%public
%byaccj
%unicode
%line
%column
%standalone

NUM = [0-9]+ ("." [0-9]+)?
NL  = \n | \r | \r\n

%{

    public static final String NUMBER_TYPE ="0";
    public static final String NEW_LINE_TYPE = "1";
    public static final String OPERATION_TYPE = "2";
    public static ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();

    public ArrayList<String> lexed_result(String type_str, String content) {
        ArrayList<String> result = new ArrayList<String>();
        result.add(type_str);
        result.add(content);
        results.add(result);
        return result;
    }

    public ArrayList<ArrayList<String>> return_result() {
        return results;
    }

%}

%%

/* operators */
"+" | 
"-" | 
"*" | 
"/" | 
"^" | 
"(" | 
")"     { // return (int) yycharat(0);
          System.out.println(yytext());
          ArrayList<String> result = lexed_result(OPERATION_TYPE, yytext());
          return Integer.parseInt(OPERATION_TYPE);
        }

/* newline */
{NL}    { System.out.println("\n");
          ArrayList<String> result = lexed_result(NEW_LINE_TYPE, "\n");
          return Integer.parseInt(NEW_LINE_TYPE);
        }

/* float */
{NUM}   { System.out.println(yytext());
          ArrayList<String> result = lexed_result(NUMBER_TYPE, yytext());
          return Integer.parseInt(NUMBER_TYPE);
        }

/* whitespace */
[ \t]+ { }

\b     { System.err.println("Sorry, backspace doesn't work"); }

/* error fallback */
[^]    { System.err.println("Error: unexpected character '"+yytext()+"'"); return -1; }