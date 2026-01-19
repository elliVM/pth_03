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
import com.teragrep.pth_03.ParserSyntaxTestingUtility;
import com.teragrep.pth_03.antlr.DPLLexer;
import com.teragrep.pth_03.antlr.DPLParser;
import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.ParseCancellationException;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.w3c.dom.NodeList;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TeragrepSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "teragrep",
            "teragrep2",
            "teragrep3",
            "teragrep4",
            "teragrep5",
            "teragrep6",
            "teragrep7",
            "teragrep8",
            "teragrep9",
            "teragrep10",
            "teragrep11",
            "teragrep12",
            "teragrep_csv_schema",
            "teragrep_csv_header",
            "teragrep_archive_summary",
            "teragrep_hdfs_save_all_params",
            "teragrep_hdfs_save_codec",
            "teragrep_syslog_stream",
            "teragrep_syslog_stream_host_port",
            "teragrep_foreachbatch",
            "teragrep_foreachbatch_transformStatement",
            "teragrep_config_set",
            "teragrep_config_get",
            "teragrep_bloom_create_table",
            "teragrep_bloom_update_table",
            "teragrep_bloom_create_regex",
            "teragrep_bloom_update_regex"
    })
    public void teragrepSyntaxParseTest(String arg) {
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep",
    })
    void xpathTest1(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep",
    })
    void xpathTest2(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_getParameter/t_getTeragrepVersionParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep4",
    })
    void xpathTest3(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_kafkaSaveModeParameter/value[1]";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_tokenizer",
    })
    void xpathTestTokenizer(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_tokenizerParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep7",
    })
    void xpathTestDynatrace(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_dynatraceParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep8",
    })
    void xpathTestDynatraceWithOptionalParam(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_dynatraceParameter/stringType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep9",
    })
    void xpathTestCsvSave(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep10",
    })
    void xpathTestJsonSave(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep11",
    })
    void xpathTestDefaultSave(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep12",
    })
    void xpathTestCsvLoad(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_loadModeParameter/t_hdfsFormatParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_csv_header",
    })
    void xpathTestCsvLoadHeader(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_loadModeParameter/t_headerParameter/booleanType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_csv_schema",
    })
    void xpathTestCsvLoadSchema(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_execParameter/t_loadModeParameter/t_schemaParameter/stringType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_archive_summary",
    })
    void xpathTestArchiveSummary(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/teragrepTransformation/t_getParameter/t_getArchiveSummaryParameter/searchTransformationRoot/directoryStatement/directoryStatement/indexStatement/stringType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_syslog_stream",
    })
    void syslogStreamTest(String arg) { // includes an eval command in the end of the query to make sure commands given after syslog work too
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String syslogPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter";
        String evalPath = "/root/transformStatement/transformStatement/evalTransformation";

        NodeList syslogNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, syslogPath, false));
        NodeList evalNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, evalPath, false));

        // Check that 1 found
        assertEquals(1,syslogNodes.getLength());
        assertEquals(1,evalNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_syslog_stream_host_port",
    })
    void syslogStreamWithHostAndPortTest(String arg) { // includes an eval command in the end of the query to make sure commands given after syslog work too
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String syslogPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter";
        String hostPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter/t_hostParameter";
        String portPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_syslogModeParameter/t_hostParameter/t_portParameter";
        String evalPath = "/root/transformStatement/transformStatement/evalTransformation";

        NodeList syslogNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, syslogPath, false));
        NodeList hostNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, hostPath, false));
        NodeList portNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, portPath, false));
        NodeList evalNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, evalPath, false));

        // Check that 1 found
        assertEquals(1,syslogNodes.getLength());
        assertEquals(1,hostNodes.getLength());
        assertEquals(1,portNodes.getLength());
        assertEquals(1,evalNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_hdfs_save_codec",
    })
    void testHdfsSaveCompression(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String hdfsSavePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter";
        String codecPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_codecParameter";

        NodeList saveNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, hdfsSavePath, false));
        NodeList codecNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, codecPath, false));

        // Check that 1 found
        assertEquals(1, saveNodes.getLength());
        assertEquals(1, codecNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_hdfs_save_all_params",
    })
    void testHdfsSaveAllParameters(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String hdfsSavePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter";
        String codecPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_codecParameter";
        String retentionPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_retentionParameter";
        String overwritePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_overwriteParameter";
        String formatPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_hdfsFormatParameter";
        String headerPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_headerParameter";
        String pathPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_saveModeParameter/t_pathParameter";

        NodeList saveNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, hdfsSavePath, false));
        NodeList codecNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, codecPath, false));
        NodeList retentionNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, retentionPath, false));
        NodeList overwriteNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, overwritePath, false));
        NodeList formatNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, formatPath, false));
        NodeList headerNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, headerPath, false));
        NodeList pathNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, pathPath, false));

        // Check that 1 found
        assertEquals(1, saveNodes.getLength());
        assertEquals(1, codecNodes.getLength());
        assertEquals(1, retentionNodes.getLength());
        assertEquals(1, overwriteNodes.getLength());
        assertEquals(1, formatNodes.getLength());
        assertEquals(1, headerNodes.getLength());
        assertEquals(1, pathNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_bloom_create_table"
    })
    void testBloomCreateTableName(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String tableParamPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_tableParameter";
        String tableNamePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_tableParameter/fieldType/value";
        String optionModePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/value";

        NodeList tableParamNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, tableParamPath, false));
        NodeList tableNameNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, tableNamePath, false));
        NodeList createNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, optionModePath, false));

        assertEquals(1, tableParamNodes.getLength());
        assertEquals(1, tableNameNodes.getLength());
        assertEquals(1, createNodes.getLength());

        assertEquals("myTable", tableNameNodes.item(0).getTextContent());
        assertEquals("create", createNodes.item(0).getTextContent());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_bloom_update_table"
    })
    void testBloomUpdateTableName(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String tableParamPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_tableParameter";
        String tableNamePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_tableParameter/fieldType/value";
        String optionModePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/value";

        NodeList tableParamNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, tableParamPath, false));
        NodeList tableNameNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, tableNamePath, false));
        NodeList updateNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, optionModePath, false));

        assertEquals(1, tableParamNodes.getLength());
        assertEquals(1, tableNameNodes.getLength());
        assertEquals(1, updateNodes.getLength());

        assertEquals("myTable", tableNameNodes.item(0).getTextContent());
        assertEquals("update", updateNodes.item(0).getTextContent());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_bloom_create_regex"
    })
    void testBloomCreateRegex(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String regexParamPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_regexParameter";
        String regexPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_regexParameter/stringType/value";
        String optionModePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/value";

        NodeList regexParamNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, regexParamPath, false));
        NodeList regexNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, regexPath, false));
        NodeList createNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, optionModePath, false));

        assertEquals(1, regexParamNodes.getLength());
        assertEquals(1, regexNodes.getLength());
        assertEquals(1, createNodes.getLength());

        assertEquals("\\w{4}", regexNodes.item(0).getTextContent());
        assertEquals("create", createNodes.item(0).getTextContent());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_bloom_update_regex"
    })
    void testBloomUpdateRegex(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String regexParamPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_regexParameter";
        String regexPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/t_regexParameter/stringType/value";
        String optionModePath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_bloomModeParameter/t_bloomOptionParameter/value";

        NodeList regexParamNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, regexParamPath, false));
        NodeList regexNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, regexPath, false));
        NodeList updateNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, optionModePath, false));

        assertEquals(1, regexParamNodes.getLength());
        assertEquals(1, regexNodes.getLength());
        assertEquals(1, updateNodes.getLength());

        assertEquals("\\w{4}", regexNodes.item(0).getTextContent());
        assertEquals("update", updateNodes.item(0).getTextContent());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_regexextract",
    })
    void testRegexExtract(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String regexextractPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_regexextractParameter";
        NodeList regexextractNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, regexextractPath, false));
        // Check that 1 found
        assertEquals(1, regexextractNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_regexextract_params",
    })
    void testRegexExtractWithParams(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";
        String regexextractPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_regexextractParameter";
        String regexPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_regexextractParameter/t_regexParameter";
        String inputPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_regexextractParameter/t_inputParameter";
        String outputPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_regexextractParameter/t_outputParameter";
        NodeList regexextractNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, regexextractPath, false));
        NodeList regexNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, regexPath, false));
        NodeList inputNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, inputPath, false));
        NodeList outputNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, outputPath, false));

        // Check that 1 found for each path
        assertEquals(1, regexextractNodes.getLength());
        assertEquals(1, regexNodes.getLength());
        assertEquals(1, inputNodes.getLength());
        assertEquals(1, outputNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_foreachbatch",
    })
    void testTeragrepForEachBatch(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";

        String febParamPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_forEachBatchParameter";
        NodeList febParamNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, febParamPath, false));

        // Check that 1 found for each path
        assertEquals(1, febParamNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_foreachbatch_transformStatement",
    })
    void testTeragrepForEachBatchWithTransformStatement(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";

        String febParamPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_forEachBatchParameter";
        String transformStmtPath = "/root/transformStatement/transformStatement/statsTransformation";
        NodeList febParamNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, febParamPath, false));
        NodeList transformStmtNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, transformStmtPath, false));

        assertEquals(1, febParamNodes.getLength());
        assertEquals(1, transformStmtNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_config_set",
    })
    void testTeragrepSetConfig(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";

        String configKeyPath = "/root/transformStatement/teragrepTransformation/t_setParameter/t_setConfigParameter/t_configKeyParameter";
        String configValuePath = "/root/transformStatement/teragrepTransformation/t_setParameter/t_setConfigParameter/t_configValueParameter";
        NodeList configKeyNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, configKeyPath, false));
        NodeList configValueNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, configValuePath, false));

        assertEquals(1, configKeyNodes.getLength());
        assertEquals(1, configValueNodes.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "teragrep_config_get",
    })
    void testTeragrepGetConfig(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/teragrep/" + arg + ".txt";

        String configGetPath = "/root/transformStatement/teragrepTransformation/t_getParameter/value";
        NodeList configGetNodes = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, configGetPath, false));

        Assertions.assertEquals(2, configGetNodes.getLength());
        Assertions.assertEquals("get", configGetNodes.item(0).getTextContent());
        Assertions.assertEquals("config", configGetNodes.item(1).getTextContent());
    }

    @ParameterizedTest(name = "{index} command = ''{0}''")
    @ValueSource(strings = {
            "| teragrep exec  migrate epoch table=\"example\"",
            "| teragrep exec  migrate epoch table='example'",
            "| teragrep exec  migrate epoch table \"example\"",
            "| teragrep exec  migrate epoch TABLE=\"example\"",
            "| teragrep exec  migrate epoch TABLE \"example\"",
            "| teragrep exec  migrate epoch table example",
            "| teragrep exec  migrate epoch table 'example'",
            "| teragrep exec  migrate epoch table=example",
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
                .map(s -> s.replace("\"", "").replace("'", "")) // remove quotes
                .map(s -> s.replace("table=", "table")) // semantically equal
                .collect(Collectors.toList());
        final List<String> expectedTokenStrings = Arrays.asList("|", "teragrep", "exec", "migrate", "epoch", "table", "example", "<eof>");
        Assertions.assertEquals(expectedTokenStrings, tokenStrings);
    }

    @ParameterizedTest(name = "{index} command = ''{0}''")
    @ValueSource(strings = {
            "| teragrep exec migrate epoch table=\"example\"",
            "| teragrep exec migrate epoch table='example'",
            "| teragrep exec migrate epoch table=\"\"",
            "| teragrep exec migrate epoch table \"example\"",
            "| teragrep exec migrate epoch TABLE=\"example\"",
            "| teragrep exec migrate epoch TABLE \"example\"",
            "| teragrep exec migrate epoch table example",
            "| teragrep exec migrate epoch table 'example'",
            "| teragrep exec migrate epoch table=example",
    })
    public void testMigrateCommandStructure(final String command) {
        final ParserStructureTestingUtility util = new ParserStructureTestingUtility();
        final String hierarchyXPath = "/root/transformStatement/teragrepTransformation/t_execParameter/t_migrateParameter/t_tableParameter/fieldType\n";
        final Object hierarchyResult = Assertions.assertDoesNotThrow(() -> util.xpathQuery(command, hierarchyXPath, false));
        final NodeList hierarchyNodes = (NodeList) hierarchyResult;
        Assertions.assertEquals(1, hierarchyNodes.getLength(),
                "Expected exactly one stringType node in parse tree with input <" + command + ">");
    }

    @ParameterizedTest(name = "{index} command = ''{0}''")
    @ValueSource(strings = {
            "| teragrep exec migrate epoch",
            "| teragrep exec migrate epoch table=\"example\"",
            "| teragrep exec migrate epoch table='example'",
            "| teragrep exec migrate epoch table=\"\"",
            "| teragrep exec migrate epoch table \"example\"",
            "| teragrep exec migrate epoch TABLE=\"example\"",
            "| teragrep exec migrate epoch TABLE \"example\"",
            "| teragrep exec migrate epoch table example",
            "| teragrep exec migrate epoch table 'example'",
            "| teragrep exec migrate epoch table=example",
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

    @ParameterizedTest(name = "{index} command = ''{0}''")
    @ValueSource(strings = {
            "| teragrep exec",
            "| teragrep exec migrate",
            "| teragrep exec migrate epoch table",
            "| teragrep exec migrate epoch table=",
    })
    public void testInvalidSyntaxThrows(final String command) {
        Assertions.assertThrows(ParseCancellationException.class, () -> {
            final CharStream input = CharStreams.fromString(command);
            final DPLLexer lexer = new DPLLexer(input);
            final DPLParser parser = new DPLParser(new CommonTokenStream(lexer));
            parser.setErrorHandler(new BailErrorStrategy()); // first syntax error aborts parsing
            parser.root();
        });
    }
}