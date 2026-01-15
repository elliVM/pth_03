/*
 * Teragrep Data Processing Language Parser Library PTH-03
 * Copyright (C) 2019, 2020, 2021, 2022  Suomen Kanuuna Oy
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
import com.teragrep.pth_03.antlr.DPLLexer;
import com.teragrep.pth_03.antlr.DPLParser;
import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public final class AdminSyntaxTests {

    @ParameterizedTest(name = "{index} command = ''{0}''")
    @ValueSource(strings = {
            "| admin migrate epoch table=\"example\"",
            "| admin migrate epoch table \"example\"",
            "| admin migrate epoch TABLE=\"example\"",
            "| admin migrate epoch TABLE \"example\"",
            "| admin migrate epoch table example",
            "| admin migrate epoch table=example",
    })
    void testMigrateCommandTokenStrings(final String command) {
        final CharStream input = CharStreams.fromString(command);
        final DPLLexer lexer = new DPLLexer(input);
        final CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();
        final List<String> tokenStrings = tokens.getTokens().stream()
                .filter(t -> t.getChannel() == Token.DEFAULT_CHANNEL)
                .map(Token::getText)
                .map(s -> s.toLowerCase(Locale.ROOT))
                .map(s -> s.replace("\"", ""))
                .map(s -> s.replace("table=", "table")) // semantically equal
                .collect(Collectors.toList());
        final List<String> expectedTokenStrings = Arrays.asList("|", "admin", "migrate", "epoch", "table", "example", "<eof>");
        Assertions.assertEquals(expectedTokenStrings, tokenStrings);
    }

    @ParameterizedTest(name = "{index} command = ''{0}''")
    @ValueSource(strings = {
            "| admin migrate epoch table=\"example\"",
            "| admin migrate epoch table \"example\"",
            "| admin migrate epoch TABLE=\"example\"",
            "| admin migrate epoch TABLE \"example\"",
            "| admin migrate epoch table example",
            "| admin migrate epoch table=example",
    })
    public void testMigrateCommandStructure(final String command) {
        final ParserStructureTestingUtility util = new ParserStructureTestingUtility();
        final String hierarchyXPath = "/root/transformStatement/adminTransformation/t_adminMode/t_migrateCommand/t_migrateSubParameter/t_epochArgs/tableOption/stringType\n";
        final Object hierarchyResult = Assertions.assertDoesNotThrow(() -> util.xpathQuery(command, hierarchyXPath, false));
        final NodeList hierarchyNodes = (NodeList) hierarchyResult;
        Assertions.assertEquals(1, hierarchyNodes.getLength(),
                "Expected exactly one stringType node in parse tree");
    }

    @ParameterizedTest(name = "{index} command = ''{0}''")
    @ValueSource(strings = {
            "| admin migrate epoch",
            "| admin migrate epoch table=\"example\"",
            "| admin migrate epoch table \"example\"",
            "| admin migrate epoch TABLE=\"example\"",
            "| admin migrate epoch TABLE \"example\"",
            "| admin migrate epoch table example",
            "| admin migrate epoch table=example",
    })
    public void adminMigrateEpochSyntaxParseTest(final String command) {
        Assertions.assertDoesNotThrow(() -> {
            final CharStream input = CharStreams.fromString(command);
            final DPLLexer lexer = new DPLLexer(input);
            final DPLParser parser = new DPLParser(new CommonTokenStream(lexer));
            parser.setErrorHandler(new BailErrorStrategy()); // first syntax error aborts parsing
            final DPLParser.RootContext root = parser.root();
            Assertions.assertNotNull(root);
            Assertions.assertEquals(0, parser.getNumberOfSyntaxErrors());
        });
    }
}
