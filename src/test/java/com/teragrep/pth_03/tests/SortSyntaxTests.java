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
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class SortSyntaxTests {

    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "sort",
            "sortdesc",
            "sortlimitbyint",
            "sortminusplus",
            "sortmodes"
    })
    public void sortSyntaxParseTest(String arg) {
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "sort",
    })
    void sortWithThreeFieldsTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";
        String sortPath = "/root/transformStatement/sortTransformation";
        String byClausePath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/sortFieldType";

        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortPath, false));
        NodeList byClauseNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, byClausePath, true));

        // Check that the correct amount is found
        assertEquals(1,sortNode.getLength());
        assertEquals(3,byClauseNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "sortdesc",
    })
    void sortDescTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";

        // Specify parse tree paths for each parameter
        String sortPath = "/root/transformStatement/sortTransformation";
        String descPath = "/root/transformStatement/sortTransformation/t_sort_dParameter";
        String byClausePath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/sortFieldType";

        // Get the list of nodes in a specific parse tree path
        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortPath, false));
        NodeList descNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, descPath, false));
        NodeList byClauseNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, byClausePath, false));

        // Check that the correct amount of nodes is found
        assertEquals(1,sortNode.getLength());
        assertEquals(2,descNode.getLength());
        assertEquals(2,byClauseNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "sortlimitbyint",
    })
    void sortLimitByIntTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";

        // Specify parse tree paths for each parameter
        String sortPath = "/root/transformStatement/sortTransformation";
        String limitIntPath = "/root/transformStatement/sortTransformation/t_sort_integerType";
        String byClausePath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/sortFieldType";

        // Get the list of nodes in a specific parse tree path
        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortPath, false));
        NodeList limitIntNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, limitIntPath, false));
        NodeList byClauseNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, byClausePath, false));

        // Check that the correct amount of nodes is found
        assertEquals(1,sortNode.getLength());
        assertEquals(1,limitIntNode.getLength());
        assertEquals(1,byClauseNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "sortminusplus",
    })
    void sortMinusPlusTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";

        // Specify parse tree paths for each parameter
        String sortPath = "/root/transformStatement/sortTransformation";
        String plusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sortPlusOption";
        String minusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sortMinusOption";
        String byClausePath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/sortFieldType";

        // Get the list of nodes in a specific parse tree path
        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortPath, false));
        NodeList plusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, plusPath, false));
        NodeList minusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, minusPath, false));
        NodeList byClauseNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, byClausePath, false));

        // Check that the correct amount of nodes is found
        assertEquals(1, sortNode.getLength());
        assertEquals(1, minusNode.getLength());
        assertEquals(1, plusNode.getLength());
        assertEquals(2, byClauseNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "sortmodes",
    })
    void sortModesTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";

        // Specify parse tree paths for each parameter
        String sortPath = "/root/transformStatement/sortTransformation";
        String autoPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodAuto/fieldType";
        String strPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodStr/fieldType";
        String numPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodNum/fieldType";
        String ipPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodIp/fieldType";
        String limitPath = "/root/transformStatement/sortTransformation/t_sort_limitParameter/integerType";


        // Get the list of nodes in a specific parse tree path
        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortPath, false));
        NodeList autoNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, autoPath, false));
        NodeList strNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, strPath, false));
        NodeList numNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numPath, false));
        NodeList ipNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, ipPath, false));
        NodeList limitNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, limitPath, false));

        // Check that the correct amount of nodes is found
        assertEquals(1,sortNode.getLength());
        assertEquals(1,autoNode.getLength());
        assertEquals(1,strNode.getLength());
        assertEquals(1,numNode.getLength());
        assertEquals(1,ipNode.getLength());
        assertEquals(1,limitNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "sortmodesminus",
    })
    void sortModesMinusTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";

        // Specify parse tree paths for each parameter
        String sortPath = "/root/transformStatement/sortTransformation";

        String autoPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodAuto/fieldType";
        String strPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodStr/fieldType";
        String numPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodNum/fieldType";
        String ipPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodIp/fieldType";

        String autoMinusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodAuto/t_sortMinusOption";
        String strMinusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodStr/t_sortMinusOption";
        String numMinusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodNum/t_sortMinusOption";
        String ipMinusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodIp/t_sortMinusOption";

        // Get the list of nodes in a specific parse tree path
        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortPath, false));

        NodeList autoNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, autoPath, false));
        NodeList strNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, strPath, false));
        NodeList numNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numPath, false));
        NodeList ipNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, ipPath, false));

        NodeList autoMinusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, autoMinusPath, false));
        NodeList strMinusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, strMinusPath, false));
        NodeList numMinusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numMinusPath, false));
        NodeList ipMinusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, ipMinusPath, false));

        // Check that the correct amount of nodes is found
        assertEquals(1,sortNode.getLength());

        assertEquals(1,autoNode.getLength());
        assertEquals(1,strNode.getLength());
        assertEquals(1,numNode.getLength());
        assertEquals(1,ipNode.getLength());

        assertEquals(1,autoMinusNode.getLength());
        assertEquals(1,strMinusNode.getLength());
        assertEquals(1,numMinusNode.getLength());
        assertEquals(1,ipMinusNode.getLength());
    }


    @ParameterizedTest
    @ValueSource(strings = {
            "sortmodesplus",
    })
    void sortModesPlusTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/sort/" + arg + ".txt";

        // Specify parse tree paths for each parameter
        String sortPath = "/root/transformStatement/sortTransformation";

        String autoPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodAuto/fieldType";
        String strPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodStr/fieldType";
        String numPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodNum/fieldType";
        String ipPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodIp/fieldType";

        String autoPlusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodAuto/t_sortPlusOption";
        String strPlusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodStr/t_sortPlusOption";
        String numPlusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodNum/t_sortPlusOption";
        String ipPlusPath = "/root/transformStatement/sortTransformation/t_sort_sortByClauseInstruction/t_sort_byMethodIp/t_sortPlusOption";

        // Get the list of nodes in a specific parse tree path
        NodeList sortNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sortPath, false));

        NodeList autoNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, autoPath, false));
        NodeList strNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, strPath, false));
        NodeList numNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numPath, false));
        NodeList ipNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, ipPath, false));

        NodeList autoPlusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, autoPlusPath, false));
        NodeList strPlusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, strPlusPath, false));
        NodeList numPlusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numPlusPath, false));
        NodeList ipPlusNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, ipPlusPath, false));

        // Check that the correct amount of nodes is found
        assertEquals(1,sortNode.getLength());

        assertEquals(1,autoNode.getLength());
        assertEquals(1,strNode.getLength());
        assertEquals(1,numNode.getLength());
        assertEquals(1,ipNode.getLength());

        assertEquals(1,autoPlusNode.getLength());
        assertEquals(1,strPlusNode.getLength());
        assertEquals(1,numPlusNode.getLength());
        assertEquals(1,ipPlusNode.getLength());
    }
}
