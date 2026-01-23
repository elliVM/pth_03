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

public final class FieldsSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "fields",
            "fields2",
            "fields_wildcard"
    })
    void fieldsSyntaxParseTest(final String arg) throws Exception {
        final String fileName = "src/test/resources/antlr4/commands/fields/" + arg + ".txt";
        final ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        parserSyntaxTestingUtility.syntaxParseTest(arg);
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "fields",
            "fields2",
            "fields_wildcard"
    })
    void testFieldsTransformationExists(final String arg) throws Exception {
        final ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        final String fileName = "src/test/resources/antlr4/commands/fields/" + arg + ".txt";
        final String xpathExp = "/root/transformStatement/fieldsTransformation";

        final NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 1 found
        Assertions.assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "fields",
    })
    void testFieldsInPlusMode(final String arg) throws Exception {
        final ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        final String fileName = "src/test/resources/antlr4/commands/fields/" + arg + ".txt";
        final String xpathExp = "/root/transformStatement/fieldsTransformation/fieldListType/fieldType";

        final NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 3 found
        Assertions.assertEquals(3,nodesA.getLength());
        Assertions.assertEquals("foo_*",nodesA.item(0).getTextContent());
        Assertions.assertEquals("bar_*",nodesA.item(1).getTextContent());
        Assertions.assertEquals("eawg",nodesA.item(2).getTextContent());

        final String xpathExpPlus = "/root/transformStatement/fieldsTransformation/value";

        final NodeList nodesB = (NodeList) pstu.xpathQueryFile(fileName, xpathExpPlus, false);
        Assertions.assertEquals(2,nodesB.getLength());
        Assertions.assertEquals("fields",nodesB.item(0).getTextContent());
        Assertions.assertEquals("+",nodesB.item(1).getTextContent());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "fields2",
    })
    void testFieldsInMinusMode(final String arg) throws Exception {
        final ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        final String fileName = "src/test/resources/antlr4/commands/fields/" + arg + ".txt";
        final String xpathExp = "/root/transformStatement/fieldsTransformation/fieldListType/fieldType";

        final NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 2 found
        Assertions.assertEquals(2,nodesA.getLength());
        Assertions.assertEquals("host",nodesA.item(0).getTextContent());
        Assertions.assertEquals("ip",nodesA.item(1).getTextContent());

        final String xpathExpPlus = "/root/transformStatement/fieldsTransformation/value";

        final NodeList nodesB = (NodeList) pstu.xpathQueryFile(fileName, xpathExpPlus, false);
        Assertions.assertEquals(2,nodesB.getLength());
        Assertions.assertEquals("fields",nodesB.item(0).getTextContent());
        Assertions.assertEquals("-",nodesB.item(1).getTextContent());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "fields_wildcard",
    })
    void testFieldsWithLonelyWildcard(final String arg) throws Exception {
        final ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        final String fileName = "src/test/resources/antlr4/commands/fields/" + arg + ".txt";
        final String xpathExp = "/root/transformStatement/fieldsTransformation/fieldListType/fieldType";

        final NodeList nodesA = (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false);
        // Check that 3 found
        Assertions.assertEquals(3,nodesA.getLength());
        Assertions.assertEquals("*",nodesA.item(0).getTextContent());
        Assertions.assertEquals("*_foo",nodesA.item(1).getTextContent());
        Assertions.assertEquals("bar",nodesA.item(2).getTextContent());

        final String xpathExpPlus = "/root/transformStatement/fieldsTransformation/value";

        final NodeList nodesB = (NodeList) pstu.xpathQueryFile(fileName, xpathExpPlus, false);
        Assertions.assertEquals(1,nodesB.getLength());
        Assertions.assertEquals("fields",nodesB.item(0).getTextContent());
    }
}
