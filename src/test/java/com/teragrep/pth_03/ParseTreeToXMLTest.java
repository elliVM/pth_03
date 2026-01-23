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

import com.teragrep.pth_03.antlr.DPLLexer;
import com.teragrep.pth_03.antlr.DPLParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.junit.jupiter.api.Test;
import org.w3c.dom.NodeList;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ParseTreeToXmlTest {
    @Test
    void xmlTreeFromDplTest() throws Exception {
        String q, e;
        // First parse incoming DPL
        q = "index = voyager _index_earliest=\"04/16/2020:10:25:40\" | chart count(_raw) as count by _time | where  count > 70";
        e = "<root>\n" +
                "    <searchTransformationRoot>\n" +
                "        <directoryStatement>\n" +
                "            <directoryStatement>\n" +
                "                <indexStatement>\n" +
                "                    <value>index = </value>\n" +
                "                    <stringType>\n" +
                "                        <value>voyager</value>\n" +
                "                    </stringType>\n" +
                "                </indexStatement>\n" +
                "            </directoryStatement>\n" +
                "            <logicalStatement>\n" +
                "                <timeStatement>\n" +
                "                    <timeQualifier>\n" +
                "                        <value>_index_earliest=</value>\n" +
                "                        <stringType>\n" +
                "                            <value>\"04/16/2020:10:25:40\"</value>\n" +
                "                        </stringType>\n" +
                "                    </timeQualifier>\n" +
                "                </timeStatement>\n" +
                "            </logicalStatement>\n" +
                "        </directoryStatement>\n" +
                "    </searchTransformationRoot>\n" +
                "    <value>|</value>\n" +
                "    <transformStatement>\n" +
                "        <chartTransformation>\n" +
                "            <value>chart</value>\n" +
                "            <t_chart_aggregationInstruction>\n" +
                "                <aggregateFunction>\n" +
                "                    <aggregateMethodCount>\n" +
                "                        <value>count(</value>\n" +
                "                        <aggregate_fieldType>\n" +
                "                            <value>_raw</value>\n" +
                "                        </aggregate_fieldType>\n" +
                "                        <value>)</value>\n" +
                "                    </aggregateMethodCount>\n" +
                "                </aggregateFunction>\n" +
                "                <t_chart_fieldRenameInstruction>\n" +
                "                    <value>as</value>\n" +
                "                    <fieldType>\n" +
                "                        <value>count</value>\n" +
                "                    </fieldType>\n" +
                "                </t_chart_fieldRenameInstruction>\n" +
                "            </t_chart_aggregationInstruction>\n" +
                "            <t_chart_by_column_rowOptions>\n" +
                "                <value>by</value>\n" +
                "                <t_row_Parameter>\n" +
                "                    <fieldType>\n" +
                "                        <value>_time</value>\n" +
                "                    </fieldType>\n" +
                "                </t_row_Parameter>\n" +
                "            </t_chart_by_column_rowOptions>\n" +
                "        </chartTransformation>\n" +
                "        <value>|</value>\n" +
                "        <transformStatement>\n" +
                "            <whereTransformation>\n" +
                "                <value>where</value>\n" +
                "                <evalStatement>\n" +
                "                    <evalStatement>\n" +
                "                        <evalFieldType>\n" +
                "                            <value>count</value>\n" +
                "                        </evalFieldType>\n" +
                "                    </evalStatement>\n" +
                "                    <value>&gt;</value>\n" +
                "                    <evalStatement>\n" +
                "                        <evalNumberType>\n" +
                "                            <value>70</value>\n" +
                "                        </evalNumberType>\n" +
                "                    </evalStatement>\n" +
                "                </evalStatement>\n" +
                "            </whereTransformation>\n" +
                "        </transformStatement>\n" +
                "    </transformStatement>\n" +
                "    <EOF/>\n" +
                "</root>\n" ;
        CharStream inputStream = CharStreams.fromString(q);
        DPLLexer lexer = new DPLLexer(inputStream);
        DPLParser parser = new DPLParser(new CommonTokenStream(lexer));
        ParseTree tree = parser.root();
        ParseTreeToXml parseTreeAsXml=new ParseTreeToXml(parser, tree);
        assertEquals(e, parseTreeAsXml.toString());
    }

    @Test
    void dplAsDom() throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();

        String q = "index = voyager _index_earliest=\"04/16/2020:10:25:40\" | chart count(_raw) as count by _time | where  count > 70";

        String xpathExp = ".//transformStatement/whereTransformation";

        NodeList nodes = (NodeList) pstu.xpathQuery(q, xpathExp, true);
        // Check that 1 found
        assertEquals(1,nodes.getLength());

    }
    @Test
        void dplChartCount() throws Exception {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();

        String q = "index = voyager _index_earliest=\"04/16/2020:10:25:40\" | chart count(_raw) as count by _time | where  count > 70";
        String xpathExp = ".//transformStatement/chartTransformation/t_chart_aggregationInstruction/aggregateFunction/aggregateMethodCount";

        NodeList nodesAgg = (NodeList) pstu.xpathQuery(q, xpathExp, false);
        // Check that 1 found
        assertEquals(1,nodesAgg.getLength());

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
    
}
