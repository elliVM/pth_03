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

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

public class ReplaceSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "replace",
            "replace2"
    })
    public void replaceSyntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/commands/replace/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "replace",
    })
    void xpathTest1(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/replace/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/replaceTransformation";

        NodeList nodesA = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "replace",
    })
    void xpathTest2(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/replace/" + arg + ".txt";

        String xpathExp = "/root/transformStatement/replaceTransformation/t_replace_withInstruction/fieldType[1]/value";

        NodeList nodes = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodes.getLength());

    }
    @ParameterizedTest
    @ValueSource(strings = {
            "replace",
    })
    void xpathTest3(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/replace/" + arg + ".txt";

        String xpathExp = "/root/transformStatement/replaceTransformation/t_replace_withInstruction/fieldType[2]/value";

        NodeList nodes = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodes.getLength());

    }
    @ParameterizedTest
    @ValueSource(strings = {
            "replace",
    })
    void xpathTest4(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/replace/" + arg + ".txt";

        String xpathExp = "/root/transformStatement/replaceTransformation/fieldListType/fieldType/value";

        NodeList nodes = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodes.getLength());

    }

    @ParameterizedTest
    @ValueSource(strings = {
            "replace2",
    })
    void multipleWiths_xpathTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/replace/" + arg + ".txt";

        String withField1 = "/root/transformStatement/replaceTransformation/t_replace_withInstruction[1]/fieldType[1]/value";
        String withField2 = "/root/transformStatement/replaceTransformation/t_replace_withInstruction[1]/fieldType[2]/value";

        String withField3 = "/root/transformStatement/replaceTransformation/t_replace_withInstruction[2]/fieldType[1]/value";
        String withField4 = "/root/transformStatement/replaceTransformation/t_replace_withInstruction[2]/fieldType[2]/value";

        String fieldListField1 = "/root/transformStatement/replaceTransformation/fieldListType/fieldType[1]/value";
        String fieldListField2 = "/root/transformStatement/replaceTransformation/fieldListType/fieldType[2]/value";

        NodeList nodes1 = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, withField1, false));
        // Check that 1 found
        assertEquals(1,nodes1.getLength());

        NodeList nodes2 = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, withField2, false));
        // Check that 1 found
        assertEquals(1,nodes2.getLength());

        NodeList nodes3 = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, withField3, false));
        // Check that 1 found
        assertEquals(1,nodes3.getLength());

        NodeList nodes4 = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, withField4, false));
        // Check that 1 found
        assertEquals(1,nodes4.getLength());

        NodeList nodes5 = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, fieldListField1, false));
        // Check that 1 found
        assertEquals(1,nodes5.getLength());

        NodeList nodes6 = assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, fieldListField2, false));
        // Check that 1 found
        assertEquals(1,nodes6.getLength());
    }
}
