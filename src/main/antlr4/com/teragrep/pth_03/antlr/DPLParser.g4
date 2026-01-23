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
parser grammar DPLParser;

@parser::members {
}

import DPLParserTransform;

options { tokenVocab=DPLLexer; }

root
        : searchTransformationRoot? (PIPE transformStatement)? EOF
        ;

searchTransformationRoot
        : directoryStatement
        | (logicalStatement AND?)*? directoryStatement (AND? logicalStatement)*?
        | directoryStatement OR logicalStatement
        | logicalStatement
        ;

directoryStatement
        : subindexStatement
        | indexStatement
        | directoryStatement OR directoryStatement
        | directoryStatement (AND*? logicalStatement)+
        | (logicalStatement AND? )+ directoryStatement
        ;

subindexStatement
        : PARENTHESIS_L directoryStatement PARENTHESIS_R
        ;

indexStatement
        : INDEX_EQ (stringType | WILDCARD)
        | INDEX_SPACE (stringType | WILDCARD) //CHECK PRIORITY
        | INDEX_NEG (stringType | WILDCARD)
        | INDEX_SPACE_NEG (stringType | WILDCARD)
        ;

logicalStatement
        : subsearchStatement
        | sublogicalStatement
        | timeStatement
        | searchQualifier
        | comparisonStatement
        | searchIndexStatement
        | NOT logicalStatement
        | logicalStatement OR logicalStatement
        | logicalStatement AND? logicalStatement
        ;

timeStatement
        : (timeFormatQualifier? (timeQualifier))
        ;

sublogicalStatement
        : PARENTHESIS_L logicalStatement PARENTHESIS_R
        ;
        
subsearchStatement
        : BRACKET_L PIPE? transformStatement BRACKET_R
        ;

timeFormatQualifier
        : TIMEFORMAT stringType //FIXME implement Time Properties
        ;

searchIndexStatement //FIXME tests plz
        : stringType
        | WILDCARD
        | termStatement
        | caseStatement
        ;

timeQualifier
        : EARLIEST timeType
        | INDEX_EARLIEST stringType
        | STARTTIME stringType
        | STARTDAYSAGO integerType
        | STARTMINUTESAGO integerType
        | STARTHOURSAGO integerType
        | STARTMONTHSAGO  integerType
        | STARTTIMEU integerType
        | LATEST timeType
        | INDEX_LATEST stringType
        | ENDTIME stringType
        | ENDDAYSAGO integerType
        | ENDMINUTESAGO integerType
        | ENDHOURSAGO integerType
        | ENDMONTHSAGO integerType
        | ENDTIMEU integerType
        | SEARCHTIMESPANHOURS integerType
        | SEARCHTIMESPANMINUTES integerType
        | SEARCHTIMESPANDAYS integerType
        | SEARCHTIMESPANMONHTS integerType
        | DAYSAGO integerType
        | MINUTESAGO integerType
        | HOURSAGO integerType
        | MONTHSAGO integerType
        ;

comparisonStatement
        : fieldOrStringType (EQ|NEQ|LT|LTE|GT|GTE) (integerType|stringType|WILDCARD)
        | fieldValueInListStatement
        | INDEX_EQ (stringType | WILDCARD)
        | INDEX_SPACE (stringType | WILDCARD) //CHECK PRIORITY
        | INDEX_NEG (stringType | WILDCARD)
        | INDEX_SPACE_NEG (stringType | WILDCARD)
        ;

searchQualifier
        : INDEX_IN GET_INDEX_STRING_BRACKET_L indexStringType (COMMA? indexStringType)* GET_INDEX_STRING_BRACKET_R
        | SOURCETYPE (EQ|NEQ) (stringType | WILDCARD)
        | SOURCETYPE IN PARENTHESIS_L stringType (COMMA? stringType)* PARENTHESIS_R
        | HOST (EQ|NEQ) (stringType | WILDCARD)
        | SOURCE (EQ|NEQ) (stringType | WILDCARD)
        | SAVEDSEARCH (EQ|NEQ) (stringType | WILDCARD )
        | EVENTTYPE (EQ|NEQ) (stringType | WILDCARD)
        | EVENTTYPETAG (EQ|NEQ) (stringType | WILDCARD)
        | HOSTTAG (EQ|NEQ) (stringType |WILDCARD)
        | TAG (EQ|NEQ) (stringType | WILDCARD)
        ;

termStatement
        : TERM PARENTHESIS_L stringType PARENTHESIS_R
        ;

caseStatement
        : CASE PARENTHESIS_L stringType PARENTHESIS_R
        ;

fieldValueInListStatement
        : fieldOrStringType IN PARENTHESIS_L stringType (COMMA stringType)* PARENTHESIS_R
        ;

whereStatement
        : (comparisonStatement | searchIndexStatement | timeStatement | fieldValueInListStatement)
        ;

// types
booleanType
        : GET_BOOLEAN_TRUE
        | GET_BOOLEAN_FALSE
        | GET_BOOLEAN_SPLIT
        ;

fieldType
        : GET_FIELD_SINGLE_QUOTED
        | GET_FIELD_DOUBLE_QUOTED
        | GET_FIELD_STRING
        ;


fieldListType //check
        : fieldType ((COMMA)? fieldType)*?
        ;

emailListParameter
        : stringType (COMMA stringType)*?
        ;

integerType
        : GET_INTEGER_INTEGER
        | GET_INTEGER_RANGE
        ;

numberType
        : GET_NUMBER_SINGLE_QUOTED
        | GET_NUMBER_DOUBLE_QUOTED
        | GET_NUMBER_NUMBER
        ;

regexStringType
        : GET_REGEX_STRING_DOUBLE_QUOTED
        ;

sortFieldType
        : GET_SORT_FIELD_SINGLE_QUOTED
        | GET_SORT_FIELD_DOUBLE_QUOTED
        | GET_SORT_FIELD_STRING
        ;

//relativeTimeQualifier
//        : TIMEUNIT
//        ;

spanType
        : GET_SPAN_SPAN_LOG
        | GET_SPAN_SPANUNIT_DURATION
        | GET_SPAN_SPANUNIT
        | GET_SPAN_SINGLE_QUOTE
        | GET_SPAN_DOUBLE_QUOTE
        | GET_SPAN_INTEGER_INTEGER
        ;

timeType
        : GET_TIME_SINGLE_QUOTE
        | GET_TIME_DOUBLE_QUOTE
        | GET_TIME_STRING
        | GET_TIME_INTEGER
        | GET_TIME_EARLIEST
        | GET_TIME_LATEST
        ;

indexStringType
        : GET_INDEX_STRING_WILDCARD
        | GET_INDEX_STRING_BRACKET_L
        | GET_INDEX_STRING_SINGLE_QUOTED
        | GET_INDEX_STRING_DOUBLE_QUOTED
        | GET_INDEX_STRING_BRACKET_R
        | GET_INDEX_STRING_STRING
        ;

stringType
        : GET_STRING_SINGLE_QUOTED
        | GET_STRING_DOUBLE_QUOTED
        | GET_STRING_STRING
        | GET_STRING_WILDCARD
        ;

fieldOrStringType
        : fieldType
        | stringType
        ;
