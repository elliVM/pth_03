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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class DbinspectSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "dbinspect",
            "dbinspect2",
            "dbinspect3",
    })
    public void dbinspectSyntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "dbinspect",
    })
    void xpathTest1(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        String xpathExp = "/root/transformStatement[1]/dbinspectTransformation[1]";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "dbinspect",
    })
    void xpathTest2(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/dbinspectTransformation/t_dbinspect_indexParameter[1]/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "dbinspect",
    })
    void xpathTest3(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/dbinspectTransformation/t_dbinspect_timeformatParameter/timeType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "dbinspect",
    })
    void xpathTest4(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/dbinspectTransformation/t_dbinspect_corruptonlyParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "dbinspect",
    })
    void xpathTest5(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/dbinspectTransformation/t_dbinspect_cachedParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "dbinspect2",
    })
    void xpathTest6(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/dbinspectTransformation/t_dbinspect_spanParameter/spanType";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    
    @ParameterizedTest
    @ValueSource(strings = {
            "dbinspect3",
    })
    void xpathTest7(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/dbinspect/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/dbinspectTransformation/t_dbinspect_spanParameter/spanType";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
}
