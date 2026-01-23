/*
 * Teragrep Data Processing Language Parser Library PTH-03
 * Copyright (C) 2019-2026  Suomen Kanuuna Oy
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://github.com/teragrep/teragrep/blob/main/LICENSE>.
 *
 *
 * Additional permission under GNU Affero General Public License version 3
 * section 7
 *
 * If you modify this Program, or any covered work, by linking or combining it
 * with other code, such other code is not for that reason alone subject to any
 * of the requirements of the GNU Affero GPL version 3 as long as this Program
 * is the same Program as licensed from Suomen Kanuuna Oy without any additional
 * modifications.
 *
 * Supplemented terms under GNU Affero General Public License version 3
 * section 7
 *
 * Origin of the software must be attributed to Suomen Kanuuna Oy. Any modified
 * versions must be marked as "Modified version of" The Program.
 *
 * Names of the licensors and authors may not be used for publicity purposes.
 *
 * No rights are granted for use of trade names, trademarks, or service marks
 * which are in The Program if any.
 *
 * Licensee must indemnify licensors and authors for any liability that these
 * contractual assumptions impose on licensors and authors.
 *
 * To the extent this program is licensed as part of the Commercial versions of
 * Teragrep, the applicable Commercial License may apply to this file if you as
 * a licensee so wish it.
 */
package com.teragrep.pth_03;


import org.antlr.v4.runtime.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;

import javax.management.RuntimeErrorException;

// see
// https://github.com/antlr/antlr4/blob/79808cdcbd360fb12df800c3f77ed219ec9fef48/tool/src/org/antlr/v4/gui/TestRig.java

public class ParserSyntaxTestingUtility {

    private final String fileName;
    private final Boolean forceFail;

    public ParserSyntaxTestingUtility(String fileName, Boolean forceFail) {
        this.fileName = fileName;
        this.forceFail = forceFail;
    }

    public void syntaxParseTest(String arg) throws Exception {
        // load lexer
        String lexerName = "com.teragrep.pth_03.antlr.DPLLexer";
        ClassLoader cl = Thread.currentThread().getContextClassLoader();
        Class<? extends Lexer> lexerClass = null;
        try {
            lexerClass = cl.loadClass(lexerName).asSubclass(Lexer.class);
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Constructor<? extends Lexer> lexerCtor = lexerClass.getConstructor(CharStream.class);
        Lexer lexer = lexerCtor.newInstance((CharStream)null);

        Class<? extends Parser> parserClass = null;
        Parser parser = null;

        // load parser
        String parserName = "com.teragrep.pth_03.antlr.DPLParser";
        parserClass = cl.loadClass(parserName).asSubclass(Parser.class);
        Constructor<? extends Parser> parserCtor = parserClass.getConstructor(TokenStream.class);
        parser = parserCtor.newInstance((TokenStream)null);

        // use UTF-8
        Charset charset = ( StandardCharsets.UTF_8 );

        // load test file
        File testFile = new File(fileName);
        CharStream charStream = CharStreams.fromPath(Paths.get(testFile.getAbsoluteFile().toString()), charset);
        process(lexer, parserClass, parser, charStream, fileName);

    }
    private void process(Lexer lexer, Class<? extends Parser> parserClass, Parser parser, CharStream input,
                           String fileName)
            throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, IOException {
        lexer.setInputStream(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();

        parser.setBuildParseTree(true);

        parser.setTokenStream(tokens);
        parser.setTrace(false);

        try {
            Method startRule = parserClass.getMethod("root"); // load "root"

            // use Default error strategy to print out out where we got
            ParserRuleContext tree = (ParserRuleContext) startRule.invoke(parser, (Object[]) null);
            String parseTree = tree.toStringTree(parser);

            // re-parse to fail the test case
            parser.reset();
            parser.setErrorHandler(new BailErrorStrategy());
            try {
                ParserRuleContext bailTree = (ParserRuleContext) startRule.invoke(parser, (Object[]) null);
                if (forceFail) {
                    throw new InvocationTargetException(new RuntimeException("force fail"));
                }
            }
            catch (InvocationTargetException e) {
                // print file contents
                FileInputStream inFile = new FileInputStream(fileName);
                File fileHandle = new File(fileName);
                byte Bytes[]=new byte[(int)fileHandle.length()];
                inFile.read(Bytes);
                System.out.println(new String(Bytes));
                inFile.close();

                // print parse tree
                System.out.println(parseTree);

                // print tokens
                for (Token tok : tokens.getTokens()) {
                    if ( tok instanceof CommonToken ) {
                        System.out.println(((CommonToken)tok).toString(lexer));
                    }
                    else {
                        System.out.println(tok.toString());
                    }
                }
                // finally fail anyways
                throw e;
            }

        }
        catch (NoSuchMethodException nsme) {
            System.err.println("No method for rule root or it has arguments");
        }
    }
}
