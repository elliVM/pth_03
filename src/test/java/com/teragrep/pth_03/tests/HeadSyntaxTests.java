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
package com.teragrep.pth_03.tests;

import com.teragrep.pth_03.ParserStructureTestingUtility;
import com.teragrep.pth_03.ParserSyntaxTestingUtility;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import java.lang.reflect.InvocationTargetException;

public class HeadSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "head",
            "head2",
            "head4",
            "head6",
    })
    public void headSyntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head",
    })
    void xpathTest1(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/headTransformation";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head",
    })
    void xpathTest2(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/headTransformation/t_head_evalParameter/evalStatement/evalStatement[1]/evalFieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head",
    })
    void xpathTest3(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/headTransformation/t_head_limitParameter/integerType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head",
    })
    void xpathTest4(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/headTransformation/t_head_nullParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head",
    })
    void xpathTest5(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/headTransformation/t_head_keepLastParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head2",
    })
    void sortAfterHeadTest(String arg) { // parsing should continue after head command
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String integerExp = "/root/transformStatement/headTransformation/t_head_integerType/value";
        String sortExp = "/root/transformStatement/transformStatement/sortTransformation/value";

        NodeList integerNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, integerExp, false));
        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortExp, false));

        // Check that 1 found
        assertEquals(1, integerNode.getLength());
        assertEquals(1, sortNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head3",
    })
    void headWithEvalAndIntegerTest(String arg) { // should not parse, both integer and eval is not allowed
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertThrows(InvocationTargetException.class, () -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head4",
    })
    void headWithParametersOnBothSides(String arg) { // parameters on left and right side of an eval statement
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String evalExp = "/root/transformStatement/headTransformation/t_head_evalParameter/evalStatement/evalStatement[1]/evalFieldType/value";
        String limitExp = "/root/transformStatement/headTransformation/t_head_limitParameter/value";
        String keepLastExp = "/root/transformStatement/headTransformation/t_head_keepLastParameter/value";
        String nullExp = "/root/transformStatement/headTransformation/t_head_nullParameter/value";

        NodeList evalNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, evalExp, false));
        NodeList limitNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, limitExp, false));
        NodeList keepLastNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, keepLastExp, false));
        NodeList nullNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, nullExp, false));

        // Check that 1 found
        assertEquals(1, evalNode.getLength());
        assertEquals(1, limitNode.getLength());
        assertEquals(1, keepLastNode.getLength());
        assertEquals(1, nullNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head5",
    })
    void headWithLimitAndInteger(String arg) { // should not parse, both integer and limit is not allowed
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertThrows(InvocationTargetException.class, () -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "head6",
    })
    void headWithoutParametersTest(String arg) { // no parameters
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/head/" + arg + ".txt";
        String headCmd = "/root/transformStatement/headTransformation/value";

        NodeList headNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, headCmd, false));

        // Check that 1 found
        assertEquals(1, headNode.getLength());
    }
}
