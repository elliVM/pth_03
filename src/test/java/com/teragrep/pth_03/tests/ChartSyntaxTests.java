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
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ChartSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "chart",
            "chart2",
            "chart3",
            "chart4",
            "chart5",
            "chart6",
            "chart7",
            "chart8",
            "chart9",
            "chart10",
            "chart11",
            "chart12",
    })
    public void chartSyntaxParseTest(String arg) throws Exception {
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }
    @Test
    void dplChart() throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();

        String q = "index = voyager _index_earliest=\"04/16/2020:10:25:40\" | chart count(_raw) as count by _time | where  count > 70";
        String xpathExp = ".//transformStatement/chartTransformation";

        NodeList nodesC = (NodeList) pstu.xpathQuery(q, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesC.getLength());

    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart",
    })
    void xpathTest1(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation";

        NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart",
    })
    void xpathTest2(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";

        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_sparklineAggregationInstruction/value[1]";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());

    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart3",
    })
    void xpathTest3(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";

        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_aggregationInstruction[1]/aggregateFunction/aggregateMethodCount/aggregate_fieldType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart4",
    })
    void xpathTest4(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_over_row_Options/t_row_Parameter/fieldType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart4",
    })
    void xpathTest5(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_by_column_Options/t_column_Parameter/fieldType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart5",
    })
    void xpathTest6(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_optionsParameter/t_chart_contParameter/booleanType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart5",
    })
    void xpathTest7(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_aggParameter/t_chart_aggregationInstruction/aggregateFunction/aggregateMethodCount/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart5",
    })
    void xpathTest8(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_aggregationInstruction/aggregateFunction/aggregateMethodCount/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart5",
    })
    void xpathTest9(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_by_column_rowOptions/t_row_Parameter/fieldType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart5",
    })
    void xpathTest10(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_by_column_rowOptions/t_row_Parameter/t_chart_bin_options/t_chart_endParameter/numberType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart5",
    })
    void xpathTest11(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_by_column_rowOptions/t_column_Parameter/fieldType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "chart5",
    })
    void xpathTest12(String arg) throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/chart/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/chartTransformation/t_chart_dedup_splitvalsParameter/booleanType/value";

        NodeList nodes = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodes.getLength());
    }
}