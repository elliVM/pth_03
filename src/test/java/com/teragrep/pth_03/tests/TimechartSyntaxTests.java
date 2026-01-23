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

public class TimechartSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "timechart",
            "timechart3",
            "timechart4",
            "timechart5",
            "timechart6",
            "timechart7",
            "timechart8",
            "timechart9",
            "timechart10",
            "timechart11",
    })
    public void timechartSyntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "timechart",
    })
    void xpathTest1(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart",
    })
    void xpathTest2(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_binOptParameter/t_timechart_spanOptParameter/t_timechart_binSpanParameter/spanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "timechart",
    })
    void xpathTest3(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/t_timechart_whereInstruction/aggregateFunction/aggregateMethodCount/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart",
    })
    void xpathTest4(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart",
    })
    void xpathTest5(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/t_timechart_tcOpt/t_timechart_usenullParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart",
    })
    void xpathTest6(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/aggregateFunction/aggregateMethodCount/value[1]";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart",
    })
    void xpathTest7(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/t_timechart_whereInstruction/numberType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart3",
    })
    void xpathTest8(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_binOptParameter/t_timechart_spanOptParameter/t_timechart_binSpanParameter/spanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart3",
    })
    void xpathTest9(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/aggregateFunction/aggregateMethodCount/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart3",
    })
    void xpathTest10(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart4",
    })
    void xpathTest11(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_contParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart4",
    })
    void xpathTest12(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_binOptParameter[1]/t_timechart_binsParameter/integerType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart4",
    })
    void xpathTest13(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_binOptParameter[2]/t_timechart_binStartEndParameter/numberType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart5",
    })
    void xpathTest14(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_binOptParameter[1]/t_timechart_binMinspanParameter/spanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart5",
    })
    void xpathTest15(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_binOptParameter[2]/t_timechart_binAligntimeParameter/timeType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest16(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_sepParameter/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest17(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_formatParameter/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest18(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_partialParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest19(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_limitParameter/value[2]";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest20(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_fixedrangeParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest21(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/aggregateFunction/aggregateMethodAvg/aggregate_fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest22(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/t_timechart_tcOpt[1]/t_timechart_useotherParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest23(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/t_timechart_tcOpt[2]/t_timechart_nullstrParameter/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
    })
    void xpathTest24(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_divideByInstruction/t_timechart_tcOpt[3]/t_timechart_otherstrParameter/stringType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }


    @ParameterizedTest
    @ValueSource(strings = {
            "timechart6",
	})
	void xpathTest25(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_fixedrangeParameter/booleanType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "timechart4",
	})
	void xpathTest26(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/t_timechart_fieldRenameInstruction/fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "timechart7",
    })
    void xpathTest27(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/timechart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/timechartTransformation/aggregateFunction/aggregateMethodPercentileVariable/aggregate_fieldType/value";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
}

