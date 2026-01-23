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

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

public class SichartSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "sichart",
            "sichart2",
            "sichart3",
            "sichart4",
            "sichart5",
            "sichart6",
    })
    public void sichartSyntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/commands/sichart/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "sichart",
    })
    void xpathTest1(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sichart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/sichartTransformation";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "sichart",
    })
    void xpathTest2(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sichart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/sichartTransformation/t_sichart_aggParameter/t_sichart_aggregationInstruction/aggregateFunction/aggregateMethodCount/aggregate_fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "sichart",
    })
    void xpathTest3(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sichart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/sichartTransformation/t_sichart_aggregationInstruction/aggregateFunction/aggregateMethodDistinctCount/aggregate_fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "sichart",
    })
    void xpathTest4(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sichart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/sichartTransformation/t_sichart_divideByInstruction/fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "sichart2",
    })
    void xpathTest5(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sichart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/sichartTransformation/t_sichart_aggregationInstruction/aggregateFunction/aggregateMethodDistinctCount/aggregate_fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "sichart2",
    })
    void xpathTest6(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sichart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/sichartTransformation/t_sichart_overInstruction/fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
}
