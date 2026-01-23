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

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import java.lang.reflect.InvocationTargetException;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TicketSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "ticket1",
            "ticket1_1",
            "ticket1_2",
            "ticket5",
            "ticket13",
            "ticket15",
            "ticket16",
            "ticket18_g",
            "ticket_2_g",
            "ticket18",
            "ticket19",
            "ticket21",
            "ticket22",
            "ticket25_1",
            "ticket25_2",
            "ticket26",
            "ticket27",
            "ticket28",
            "ticket28_2",
            "ticket31",
            "ticket31_2",
            "ticket37",
            "ticket40",
            "ticket42",
            "ticket42_2",
            "ticket43",
            "ticket43_1",
            "ticket48",
            "ticket49",
            "ticket51",
            "ticket51_A",
            "tickets51_B",
            "ticket51_C",
            "ticket51_D",
            "ticket51_E",
            "ticket51_F",
            "ticket51_G",
            "ticket51_H",
            "ticket51_1",
            "ticket51_2",
            "ticket51_fake_result",
            "ticket51_works",
            "ticket51_no",
            "ticket51_no_result",
            "ticket51_wildcard",
            "ticket52",
            "ticket55",
            "ticket56",
            "ticket57",
            "ticket60",
            "ticket60_a",
            "ticket63_A",
            "ticket63",
            "ticket64",
            "ticket66",
            "ticket68",
            "ticket69",
            "ticket73",
            "ticket74_1",
            "ticket75",
            "ticket75_1",
            "ticket75_2",
            "ticket75_3",
            "ticket75_4",
            "ticket76_1",
            "ticket76_correct",
            "ticket76",
            "ticket77",
            "ticket78",
            "ticket81",
            "ticket83",
            "ticket84",
            "ticket86",
            "ticket87_2",
            "ticket81_a",
            "ticket91",
            "ticket91_2",
            "ticket92",
            "ticket93",
            "ticket93_A",
            "ticket93_B",
            "ticket95",
            "ticket96",
            "ticket100",
            "ticket102",
            "ticket109",
            "ticket112",
            "ticket120",
            "ticket121",
            "ticket120_1",
            "ticket120_2",
            "ticket122",
            "ticket122_1",
            "ticket192",
            "ticket255",
            "ticket169_pth10",
            "ticket241PTH10"
    })
    public void syntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/tickets/"+ arg +".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }

    // TODO when enabling this test, just add the text files back to the syntaxParseTest above
    @Disabled(value = "GH issue #49: sort doesn't support sorting with more than two fields.")
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "tickets_71",
            "tickets71_A",
    })
    public void sortParseTest(String arg) {
        String fileName = "src/test/resources/antlr4/tickets/"+ arg +".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket76_correct",
    })
    void xpathTest1(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement/indexStatement/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "ticket76",
    })
    void xpathTest2(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement/indexStatement/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
//ticket 51
    @ParameterizedTest
    @ValueSource(strings = {
            "ticket51_C",
    })
    void xpathTest3(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement/directoryStatement/directoryStatement[1]/indexStatement/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket51_D",
    })
    void xpathTest4(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement/directoryStatement/directoryStatement[1]/indexStatement/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket51_E",
    })
    void xpathTest5(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement/directoryStatement[1]/indexStatement/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket51_F",
    })
    void xpathTest6(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/logicalStatement/sublogicalStatement/logicalStatement/logicalStatement[1]/timeStatement/timeQualifier/timeType";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket51_G",
    })
    void xpathTest7(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement[2]/subindexStatement/directoryStatement/logicalStatement/sublogicalStatement/logicalStatement/logicalStatement[2]/timeStatement/timeQualifier/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket51_H",
    })
    void xpathTest8(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement[2]/subindexStatement/directoryStatement/subindexStatement/directoryStatement/indexStatement/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket120_1",
    })
    void xpathTest9(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/directoryStatement/logicalStatement/logicalStatement[2]/timeStatement/timeQualifier/timeType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket121",
    })
    void xpathTest10(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        String xpathExp = "/root/searchTransformationRoot/directoryStatement/logicalStatement/timeStatement/timeQualifier/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "ticket17",
    })
    void invalidWhereQueryTest(String arg) {
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertThrows(InvocationTargetException.class, () -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @Disabled(value = "Internal issue #82: Can't parse second right parenthesis")
    @ParameterizedTest
    @ValueSource(strings = {
            "ticket82",
    })
    void aggregateWithEvalColumnTest(String arg) {
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @Disabled(value = "Internal issue #82: Can't parse second right parenthesis")
    @ParameterizedTest
    @ValueSource(strings = {
            "ticket84_1",
    })
    void aggregateWithEvalColumnTest_2(String arg) {
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @Disabled(value = "GH pth_03 #50: Not implemented. Parameter is not allowed on the left side of the FieldList yet.")
    @ParameterizedTest
    @ValueSource(strings = {
            "ticket87",
    })
    void dedupConsecutiveOnLeftSideOfFieldListTest(String arg) { // should work on either side of the fieldList
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @Disabled(value = "GH pth_03 #50: Not implemented. Parameter is not allowed on the left side of the FieldList yet.")
    @ParameterizedTest
    @ValueSource(strings = {
            "ticket87_1",
    })
    void dedupKeepemptyOnLeftSideOfFieldListTest(String arg) { // should work on either side of the fieldList
        String fileName = "src/test/resources/antlr4/tickets/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }
}
