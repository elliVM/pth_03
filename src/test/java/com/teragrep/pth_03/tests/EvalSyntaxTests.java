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

import java.lang.reflect.InvocationTargetException;

public class EvalSyntaxTests {
    @ParameterizedTest(name = "{index} command=''{0}''")
    @ValueSource(strings = {
            "eval",
            "eval2",
            "eval3",
            "eval4",
            "eval5",
            "eval6",
            "eval7",
            "eval8",
            "eval_ceil",
            "eval_ceiling",
            "eval_round",
            "eval_round_no_precision",
            "eval_log",
            "eval_log_no_base",
            "eval_substr",
            "eval_substr_no_endindex",
            "eval_sum",
            "eval_multiple_statements",
            "eval_multiple_statements_with_functions",
            "eval_validate",
            "eval_avg"
    })
    public void evalSyntaxParseTest(String arg) {
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        ParserSyntaxTestingUtility parserSyntaxTestingUtility
                = new ParserSyntaxTestingUtility(fileName, false);
        Assertions.assertDoesNotThrow(() -> parserSyntaxTestingUtility.syntaxParseTest(arg));
    }
//    FIXME XML is incomplete for test cases with multiple <field>=<expression> statements. Only the first statement shows up in the XMLs.
    @ParameterizedTest
    @ValueSource(strings = {
            "eval",
    })
    void xpathTest1(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval",
    })
    void xpathTest2(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/fieldType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 2 found, because query has two fieldTypes
        assertEquals(2, nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval",
    })
    void xpathTest3(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStatement[1]/evalNumberType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval2",
    })
    void xpathTest4(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStringType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval3",
    })
    void xpathTest5(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval4",
    })
    void xpathTest6(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStatement[1]/evalStatement[1]/evalFieldType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 2 found
        assertEquals(2, nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval4",
    })
    void xpathTest7(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalStatement[1]/evalStatement[2]/evalStringType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest8(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement/evalStatement[1]/evalFunctionStatement/evalMethodSubstr/evalStatement[1]/evalFieldType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest9(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement/evalStatement[1]/evalFunctionStatement/evalMethodSubstr/evalStatement[2]/evalNumberType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest10(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[1]/evalStatement[2]/evalStringType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest11(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[2]/evalFunctionStatement/evalMethodLen/evalStatement/evalFieldType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval6",
    })
    void xpathTest12(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[3]/evalFunctionStatement/evalMethodFalse/value[1]";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval7",
    })
    void xpathTest13(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[1]/evalFunctionStatement/evalMethodTrue/value[1]";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }
    @ParameterizedTest
    @ValueSource(strings = {
            "eval7",
    })
    void xpathTest14(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodIf/evalStatement[2]/evalStringType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval8",
    })
    void xpathTest15(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodTonumber/evalStatement[1]/evalStringType/value";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_ceiling",
            "eval_ceil"
    })
    void xpathTest16(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodCeiling/evalStatement/evalNumberType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_round_no_precision"
    })
    void xpathTest17(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodRound/evalStatement/evalNumberType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found (number)
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_round"
    })
    void xpathTest18(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodRound/evalStatement/evalNumberType";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 2 found (number, precision)
        assertEquals(2,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_log_no_base"
    })
    void xpathTest19(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodLog/evalStatement";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_log"
    })
    void xpathTest20(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodLog/evalStatement";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 2 found (number, base)
        assertEquals(2,nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_substr"
    })
    void xpathTest21(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodSubstr/evalStatement";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 3 found (string, start, end)
        assertEquals(3, nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_substr_no_endindex"
    })
    void xpathTest22(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodSubstr/evalStatement";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 2 found (string, start)
        assertEquals(2, nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_multiple_statements"
    })
    void xpathTest23(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 2 found (a=<evalStatement> and b=<evalStatement>)
        assertEquals(2, nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_multiple_statements_with_functions"
    })
    void xpathTest24(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp0 = "/root/transformStatement/evalTransformation/t_eval_evalParameter";
        String xpathExp1 = "/root/transformStatement/evalTransformation/t_eval_evalParameter[1]/evalStatement/evalFunctionStatement/evalMethodRound";
        String xpathExp2 = "/root/transformStatement/evalTransformation/t_eval_evalParameter[2]/evalStatement/evalFunctionStatement/evalMethodExact";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp0, false));
        // Check that 2 found (a=<evalStatement> and b=<evalStatement>)
        assertEquals(2, nodesA.getLength());

        NodeList nodesB = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp1, false));
        // Check that 1 found (evalMethodRound)
        assertEquals(1, nodesB.getLength());

        NodeList nodesC = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp2, false));
        // Check that 1 found (evalMethodExact)
        assertEquals(1, nodesC.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_validate"
    })
    void xpathTest25(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        String xpathExp = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodValidate/evalStatement[5]/evalFunctionStatement/evalMethodIsnull";

        NodeList nodesA = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, xpathExp, false));
        // Check that 1 found
        assertEquals(1, nodesA.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_avg"
    })
    void avgTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";

        String avgMethod = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodAvg";
        String parameters = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodAvg/evalStatement";
        String fieldParam = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodAvg/evalStatement[1]/evalFieldType";
        String numberParam = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodAvg/evalStatement[2]/evalNumberType";
        String stringParam = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodAvg/evalStatement[3]/evalStringType";

        NodeList avgNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, avgMethod, false));
        assertEquals(1, avgNode.getLength());
      
        NodeList evalStmts = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, parameters, false));
        assertEquals(3, evalStmts.getLength());

        NodeList fieldNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, fieldParam, false));
        assertEquals(1, fieldNode.getLength());
      
        NodeList numberNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numberParam, false));
        assertEquals(1, numberNode.getLength());

        NodeList stringNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, stringParam, false));
        assertEquals(1, stringNode.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "eval_sum"
    })
    void sumTest(String arg) {
        ParserStructureTestingUtility pstu = new ParserStructureTestingUtility();
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";

        String sumMethod = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodSum";
        String parameters = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodSum/evalStatement";
        String fieldParam = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodSum/evalStatement[1]/evalFieldType";
        String numberParam1 = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodSum/evalStatement[2]/evalNumberType";
        String numberParam2 = "/root/transformStatement/evalTransformation/t_eval_evalParameter/evalStatement/evalFunctionStatement/evalMethodSum/evalStatement[2]/evalNumberType";

        NodeList sumNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, sumMethod, false));
        assertEquals(1, sumNode.getLength());

        NodeList evalStmts = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, parameters, false));
        assertEquals(3, evalStmts.getLength());

        NodeList fieldNode = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, fieldParam, false));
        assertEquals(1, fieldNode.getLength());

        NodeList numberNode1 = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numberParam1, false));
        assertEquals(1, numberNode1.getLength());

        NodeList numberNode2 = Assertions.assertDoesNotThrow(() -> (NodeList) pstu.xpathQueryFile(fileName, numberParam2, false));
        assertEquals(1, numberNode2.getLength());
    }

    @ParameterizedTest
    @ValueSource(strings = {
            "missingParameterInIf"
    })
    void missingParameterInIfTest(String arg) {
        String fileName = "src/test/resources/antlr4/commands/eval/" + arg + ".txt";
        ParserSyntaxTestingUtility pstu = new ParserSyntaxTestingUtility(fileName,false);

        // Invalid syntax should throw an exception.
        Assertions.assertThrows(InvocationTargetException.class, () -> pstu.syntaxParseTest(arg));
    }
}
