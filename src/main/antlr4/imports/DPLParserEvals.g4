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
// -*- mode: conf; -*-
parser grammar DPLParserEvals;

// eval 
evalStatement
        : subEvalStatement # l_evalStatement_subEvalStatement
        | evalFunctionStatement # l_evalStatement_evalFunctionStatement
        | evalNullType #empty
        | evalNumberType # l_evalStatement_evalNumberType
        | evalIntegerType # l_evalStatement_evalIntegerType
        | evalFieldType # l_evalStatement_evalFieldType
        | evalStringType # l_evalStatement_evalStringType // always double quoted ?
        | evalStatement (EVAL_LANGUAGE_MODE_DEQ|EVAL_LANGUAGE_MODE_EQ|EVAL_LANGUAGE_MODE_LTE|EVAL_LANGUAGE_MODE_GTE|EVAL_LANGUAGE_MODE_LT|EVAL_LANGUAGE_MODE_GT|EVAL_LANGUAGE_MODE_NEQ|EVAL_LANGUAGE_MODE_LIKE|EVAL_LANGUAGE_MODE_Like) evalStatement # l_evalStatement_evalCompareStatement
        | evalStatement (EVAL_LANGUAGE_MODE_WILDCARD|EVAL_LANGUAGE_MODE_SLASH|EVAL_LANGUAGE_MODE_PERCENT) evalStatement # l_evalStatement_evalCalculateStatement_multipliers
        | evalStatement (EVAL_LANGUAGE_MODE_PLUS|EVAL_LANGUAGE_MODE_MINUS) evalStatement # l_evalStatement_evalCalculateStatement_minus_plus
        | evalStatement EVAL_LANGUAGE_MODE_DOT evalStatement # l_evalStatement_evalConcatenateStatement // note that string+string is handled by above
        | (EVAL_LANGUAGE_MODE_NOT|EVAL_LANGUAGE_MODE_EXCLAMATION) evalStatement # l_evalStatement_evalLogicNegationStatement
        | (EVAL_LANGUAGE_MODE_NOT|EVAL_LANGUAGE_MODE_EXCLAMATION) EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R evalStatement # l_evalStatement_evalLogicNegationStatement
        | evalStatement (EVAL_LANGUAGE_MODE_AND|EVAL_LANGUAGE_MODE_OR|EVAL_LANGUAGE_MODE_XOR) evalStatement # l_evalStatement_evalLogicStatement
        ;

//inside quotes
evalNullType
        : EVAL_LANGUAGE_MODE_NULL
        ;

evalIntegerType
        : EVAL_LANGUAGE_MODE_INTEGER
        ;

evalNumberType
        : EVAL_LANGUAGE_MODE_DECIMAL
        | EVAL_LANGUAGE_MODE_INTEGER
        ;

 evalFieldType
        : EVAL_LANGUAGE_MODE_STRING_MATCH
        | EVAL_LANGUAGE_MODE_SINGLE_QUOTED_STRING_MATCH
        ;

 evalStringType
        : EVAL_LANGUAGE_MODE_QUOTED_STRING_MATCH
        ;

// Any eval inside parenthesis 
subEvalStatement
        : EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalFunctionStatement
        : evalMethodTrue // BooleanFunction
        | evalMethodFalse // BooleanFunction
        | evalMethodTypeof // BooleanFunction
        | evalMethodCase // BooleanFunction
        | evalMethodCidrmatch // BooleanFunction
        | evalMethodLike // BooleanFunction
        | evalMethodIn // BooleanFunction
        | evalMethodMatch // BooleanFunction
        | evalMethodSearchmatch // BooleanFunction
        | evalMethodIsbool // BooleanFunction
        | evalMethodIsint // BooleanFunction
        | evalMethodIsnum // BooleanFunction
        | evalMethodIsnotnull // BooleanFunction
        | evalMethodIsnull // BooleanFunction
        | evalMethodIsstr // BooleanFunction
        | evalMethodJSONValid // BooleanFunction
        | evalMethodAbs // NumericFunction
        | evalMethodAcos // NumericFunction
        | evalMethodAcosh // NumericFunction
        | evalMethodAsin // NumericFunction
        | evalMethodAsinh // NumericFunction
        | evalMethodAtan // NumericFunction
        | evalMethodAtan2 // NumericFunction
        | evalMethodAtanh // NumericFunction
        | evalMethodAvg // NumericFunction
        | evalMethodCeiling // NumericFunction
        | evalMethodCos // NumericFunction
        | evalMethodCosh // NumericFunction
        | evalMethodLen // NumericFunction
        | evalMethodLn // NumericFunction
        | evalMethodLog // NumericFunction
        | evalMethodExp // NumericFunction
        | evalMethodHypot // NumericFunction
        | evalMethodFloor // NumericFunction
        | evalMethodMin // NumericFunction
        | evalMethodMax // NumericFunction
        | evalMethodPi // NumericFunction
        | evalMethodPow // NumericFunction
        | evalMethodRandom // NumericFunction
        | evalMethodSin // NumericFunction
        | evalMethodSinh // NumericFunction
        | evalMethodSigfig // NumericFunction
        | evalMethodSqrt // NumericFunction
        | evalMethodSum // NumericFunction
        | evalMethodTan // NumericFunction
        | evalMethodTanh // NumericFunction
        | evalMethodTonumber // NumericFunction
        | evalMethodRound // NumericFunction
        | evalMethodExact // NumericFunction
        | evalMethodMvappend // MVFunction
        | evalMethodMvcount // MVFunction
        | evalMethodMvdedup // MVFunction
        | evalMethodMvfilter // MVFunction
        | evalMethodMvfind // MVFunction
        | evalMethodMvindex // MVFunction
        | evalMethodMvjoin // MVFunction
        | evalMethodMvrange // MVFunction
        | evalMethodMvsort // MVFunction
        | evalMethodMvzip // MVFunction
        | evalMethodCommands // MVFunction
        | evalMethodIf // CaseFunction
        | evalMethodIfnull // CaseFunction
        | evalMethodCoalesce // CaseFunction
        | evalMethodNullif // CaseFunction
        | evalMethodValidate // CaseFunction
        | evalMethodNow // TimeFunction
        | evalMethodStrptime // TimeFunction
        | evalMethodTime // TimeFunction
        | evalMethodRelative_time // TimeFunction
        | evalMethodNull // NullFunction
        | evalMethodLower // StringFunction
        | evalMethodLtrim // StringFunction
        | evalMethodMd5 // StringFunction
        | evalMethodReplace // StringFunction
        | evalMethodRtrim // StringFunction
        | evalMethodSha1 // StringFunction
        | evalMethodSha256 // StringFunction
        | evalMethodSha512 // StringFunction
        | evalMethodSpath // StringFunction
        | evalMethodSplit // StringFunction
        | evalMethodStrftime // StringFunction
        | evalMethodSubstr // StringFunction
        | evalMethodTostring // StringFunction
        | evalMethodTrim // StringFunction
        | evalMethodUpper // StringFunction
        | evalMethodUrldecode // StringFunction
        | evalMethodJsonObject // objectFunction
        ;

evalMethodAbs
        : EVAL_LANGUAGE_MODE_ABS EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAcos
        : EVAL_LANGUAGE_MODE_ACOS EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAcosh
        : EVAL_LANGUAGE_MODE_ACOSH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAsin
        : EVAL_LANGUAGE_MODE_ASIN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAsinh
        : EVAL_LANGUAGE_MODE_ASINH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAtan
        : EVAL_LANGUAGE_MODE_ATAN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAtan2
        : EVAL_LANGUAGE_MODE_ATAN2 EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAtanh
        : EVAL_LANGUAGE_MODE_ATANH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodAvg
        : EVAL_LANGUAGE_MODE_AVG EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)+ EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodCase
        : EVAL_LANGUAGE_MODE_CASE EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)+ EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodCeiling
        : EVAL_LANGUAGE_MODE_CEILING EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodCidrmatch
        : EVAL_LANGUAGE_MODE_CIDRMATCH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodCoalesce
        : EVAL_LANGUAGE_MODE_COALESCE EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement ((EVAL_LANGUAGE_MODE_COMMA) evalStatement)+ EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodCommands
        : EVAL_LANGUAGE_MODE_COMMANDS EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodCos
        : EVAL_LANGUAGE_MODE_COS EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodCosh
        : EVAL_LANGUAGE_MODE_COSH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodExact
        : EVAL_LANGUAGE_MODE_EXACT EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodExp
        : EVAL_LANGUAGE_MODE_EXP EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodFalse
        : EVAL_LANGUAGE_MODE_FALSE EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodFloor
        : EVAL_LANGUAGE_MODE_FLOOR EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodHypot
        : EVAL_LANGUAGE_MODE_HYPOT EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIf
        : EVAL_LANGUAGE_MODE_IF EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIfnull
        : EVAL_LANGUAGE_MODE_IFNULL EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIn
        : EVAL_LANGUAGE_MODE_IN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA (evalStatement))*  EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIsbool
        : EVAL_LANGUAGE_MODE_ISBOOL EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIsint
        : EVAL_LANGUAGE_MODE_ISINT EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIsnotnull
        : EVAL_LANGUAGE_MODE_ISNOTNULL EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIsnull
        : EVAL_LANGUAGE_MODE_ISNULL EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIsnum
        : EVAL_LANGUAGE_MODE_ISNUM EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodIsstr
        : EVAL_LANGUAGE_MODE_ISSTR EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodJSONValid
        : EVAL_LANGUAGE_MODE_JSON_VALID EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodLen
        : EVAL_LANGUAGE_MODE_LEN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodLike
        : EVAL_LANGUAGE_MODE_LIKE EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodLn
        : EVAL_LANGUAGE_MODE_LN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodLog
        : EVAL_LANGUAGE_MODE_LOG EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)? EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodLower
        : EVAL_LANGUAGE_MODE_LOWER EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodLtrim
        : EVAL_LANGUAGE_MODE_LTRIM EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMatch
        : EVAL_LANGUAGE_MODE_MATCH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMax
        : EVAL_LANGUAGE_MODE_MAX EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)* EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMd5
        : EVAL_LANGUAGE_MODE_MD5 EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMin
        : EVAL_LANGUAGE_MODE_MIN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)* EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvappend
        : EVAL_LANGUAGE_MODE_MVAPPEND EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)* EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvcount
        : EVAL_LANGUAGE_MODE_MVCOUNT EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvdedup
        : EVAL_LANGUAGE_MODE_MVDEDUP EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvfilter
        : EVAL_LANGUAGE_MODE_MVFILTER EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvfind
        : EVAL_LANGUAGE_MODE_MVFIND EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvindex
        : EVAL_LANGUAGE_MODE_MVINDEX EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)? EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvjoin
        : EVAL_LANGUAGE_MODE_MVJOIN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvrange
        : EVAL_LANGUAGE_MODE_MVRANGE EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvsort
        : EVAL_LANGUAGE_MODE_MVSORT EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodMvzip
        : EVAL_LANGUAGE_MODE_MVZIP EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)? EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodNow
        : EVAL_LANGUAGE_MODE_NOW EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodNull
        : EVAL_LANGUAGE_MODE_NULL EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodNullif
        : EVAL_LANGUAGE_MODE_NULLIF EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodPi
        : EVAL_LANGUAGE_MODE_PI EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodPow
        : EVAL_LANGUAGE_MODE_POW EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodRandom
        : EVAL_LANGUAGE_MODE_RANDOM EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodRelative_time
        : EVAL_LANGUAGE_MODE_RELATIVE_TIME EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodReplace
        : EVAL_LANGUAGE_MODE_REPLACE EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodRound
        : EVAL_LANGUAGE_MODE_ROUND EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)? EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodRtrim
        : EVAL_LANGUAGE_MODE_RTRIM EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSearchmatch
        : EVAL_LANGUAGE_MODE_SEARCHMATCH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSha1
        : EVAL_LANGUAGE_MODE_SHA1 EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSha256
        : EVAL_LANGUAGE_MODE_SHA256 EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSha512
        : EVAL_LANGUAGE_MODE_SHA512 EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSigfig
        : EVAL_LANGUAGE_MODE_SIGFIG EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSin
        : EVAL_LANGUAGE_MODE_SIN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSinh
        : EVAL_LANGUAGE_MODE_SINH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSpath
        : EVAL_LANGUAGE_MODE_SPATH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSplit
        : EVAL_LANGUAGE_MODE_SPLIT EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSqrt
        : EVAL_LANGUAGE_MODE_SQRT EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSum
        : EVAL_LANGUAGE_MODE_SUM EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)+ EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodStrftime
        : EVAL_LANGUAGE_MODE_STRFTIME EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodStrptime
        : EVAL_LANGUAGE_MODE_STRPTIME EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodSubstr
        : EVAL_LANGUAGE_MODE_SUBSTR EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)? EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTan
        : EVAL_LANGUAGE_MODE_TAN EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTanh
        : EVAL_LANGUAGE_MODE_TANH EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTime
        : EVAL_LANGUAGE_MODE_TIME EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTonumber
        : EVAL_LANGUAGE_MODE_TONUMBER EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)? EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTostring
        : EVAL_LANGUAGE_MODE_TOSTRING EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)? EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTrim
        : EVAL_LANGUAGE_MODE_TRIM EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTrue
        : EVAL_LANGUAGE_MODE_TRUE EVAL_LANGUAGE_MODE_PARENTHESIS_L EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodTypeof
        : EVAL_LANGUAGE_MODE_TYPEOF EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodUpper
        : EVAL_LANGUAGE_MODE_UPPER EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodUrldecode
        : EVAL_LANGUAGE_MODE_URLDECODE EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodValidate
        : EVAL_LANGUAGE_MODE_VALIDATE EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement (EVAL_LANGUAGE_MODE_COMMA evalStatement)+ EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

evalMethodJsonObject
        : EVAL_LANGUAGE_MODE_JSON_OBJECT EVAL_LANGUAGE_MODE_PARENTHESIS_L (evalStatement EVAL_LANGUAGE_MODE_COMMA evalStatement)+ EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;


// types
