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

lexer grammar COMMAND_MSTATS_MODE;

COMMAND_MSTATS_MODE_ANTLR_BUG: 'command_mstats_mode_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ COMMAND_MSTATS_MODE ++++++++++++++
mode COMMAND_MSTATS_MODE;

// skip
COMMAND_MSTATS_MODE_SPACE: SPACE -> channel(HIDDEN);

// exits
COMMAND_MSTATS_MODE_PIPE: '|' -> type(PIPE), popMode;
COMMAND_MSTATS_MODE_BRACKET_R: ']' -> type(BRACKET_R), popMode, popMode;

// tokens
COMMAND_MSTATS_MODE_INT: DIGIT;
fragment DIGIT: [0-99];
COMMAND_MSTATS_MODE_CHART : 'chart=' -> pushMode(GET_BOOLEAN);
COMMAND_MSTATS_MODE_WHERE: ( 'where' | 'WHERE' ) -> pushMode(COMMAND_MSTATS_MODE_WHERE_MODE) ;
COMMAND_MSTATS_MODE_PRESTATS : 'prestats=' -> pushMode(GET_BOOLEAN);
COMMAND_MSTATS_MODE_BACKFILL : 'backfill=' -> pushMode(GET_BOOLEAN);
COMMAND_MSTATS_MODE_APPEND : 'append=' -> pushMode(GET_BOOLEAN);
COMMAND_MSTATS_MODE_UPDATE_PERIOD : 'update_period=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_FILLNULL_VALUE : 'fillnull_value=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_CHUNK_SIZE : 'chunk_size=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_CHART_NULLSTR: 'chart.nullstr=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_CHART_OTHERSTR: 'chart.otherstr=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_CHART_USENULL: 'chart.usenull=' -> pushMode(GET_BOOLEAN);
COMMAND_MSTATS_MODE_CHART_USEOTHER: 'chart.useother=' -> pushMode(GET_BOOLEAN);
COMMAND_MSTATS_MODE_CHART_AGG: 'chart.agg=' -> pushMode(GET_BOOLEAN);
COMMAND_MSTATS_MODE_COMMA : ',' -> type(COMMA);
COMMAND_MSTATS_MODE_SPAN : 'span=' -> pushMode(GET_SPAN) ;

COMMAND_MSTATS_MODE_SINGLE_QUOTE: '\'' ( '\\'. | ~('\''| '\\') )* '\''-> type(GET_FIELD_SINGLE_QUOTED);
COMMAND_MSTATS_MODE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_FIELD_DOUBLE_QUOTED);
COMMAND_MSTATS_MODE_AS: ('AS'|'as'|'As');
COMMAND_MSTATS_SUBMODE_CHART_LIMIT_TOP : 'chart.limit=top' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_SUBMODE_CHART_LIMIT_BOTTOM : 'chart.limit=bottom' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_SUBMODE_CHART_LIMIT: 'chart.limit=' -> pushMode(GET_INTEGER);

// aggregateMethod
COMMAND_MSTATS_MODE_COUNT: 'count' -> type(METHOD_AGGREGATE_COUNT);
COMMAND_MSTATS_MODE_AVG_PARENTHESIS_R: 'avg(' -> type(METHOD_AGGREGATE_AVG), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_MEAN_PARENTHESIS_R: 'mean(' -> type(METHOD_AGGREGATE_MEAN), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_C_PARENTHESIS_R: 'c(' -> type(METHOD_AGGREGATE_C), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_COUNT_PARENTHESIS_R: 'count(' -> type(METHOD_AGGREGATE_COUNT_B), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_DC_PARENTHESIS_R: 'dc(' -> type(METHOD_AGGREGATE_DC), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_DISTINCT_COUNT_PARENTHESIS_R: 'distinct_count(' -> type(METHOD_AGGREGATE_DISTINCT_COUNT), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_EARLIEST_PARENTHESIS_R: 'earliest(' -> type(METHOD_AGGREGATE_EARLIEST), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_EARLIEST_TIME_PARENTHESIS_R: 'earliest_time(' -> type(METHOD_AGGREGATE_EARLIEST_TIME), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_ESTDC_PARENTHESIS_R: 'estdc(' -> type(METHOD_AGGREGATE_ESTDC), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_ESTDC_ERROR_PARENTHESIS_R: 'estdc_error(' -> type(METHOD_AGGREGATE_ESTDC_ERROR), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_FIRST_PARENTHESIS_R: 'first(' -> type(METHOD_AGGREGATE_FIRST), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_LAST_PARENTHESIS_R: 'last(' -> type(METHOD_AGGREGATE_LAST), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_LATEST_PARENTHESIS_R: 'latest(' -> type(METHOD_AGGREGATE_LATEST), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_LATEST_TIME_PARENTHESIS_R: 'latest_time(' -> type(METHOD_AGGREGATE_LATEST_TIME), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_LIST_PARENTHESIS_R: 'list(' -> type(METHOD_AGGREGATE_LIST), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_MAX_PARENTHESIS_R: 'max(' -> type(METHOD_AGGREGATE_MAX), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_MEDIAN_PARENTHESIS_R: 'median(' -> type(METHOD_AGGREGATE_MEDIAN), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_MIN_PARENTHESIS_R: 'min(' -> type(METHOD_AGGREGATE_MIN), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_MODE_PARENTHESIS_R: 'mode(' -> type(METHOD_AGGREGATE_MODE), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_P_PARENTHESIS_R: 'p(' -> type(METHOD_AGGREGATE_P), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_PERC_PARENTHESIS_R: 'perc(' -> type(METHOD_AGGREGATE_PERC), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_EXACTPERC_PARENTHESIS_R: 'exactperc(' -> type(METHOD_AGGREGATE_EXACTPERC), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_UPPERPERC_PARENTHESIS_R: 'upperperc(' -> type(METHOD_AGGREGATE_UPPERPERC), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_PERCINT_PARENTHESIS_R: 'percint(' -> type(METHOD_AGGREGATE_PERCINT), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_RANGE_PARENTHESIS_R: 'range(' -> type(METHOD_AGGREGATE_RANGE), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_RATE_PARENTHESIS_R: 'rate(' -> type(METHOD_AGGREGATE_RATE), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_STDEV_PARENTHESIS_R: 'stdev(' -> type(METHOD_AGGREGATE_STDEV), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_STDEVP_PARENTHESIS_R: 'stdevp(' -> type(METHOD_AGGREGATE_STDEVP), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_SUM_PARENTHESIS_R: 'sum(' -> type(METHOD_AGGREGATE_SUM), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_SUMSQ_PARENTHESIS_R: 'sumsq(' -> type(METHOD_AGGREGATE_SUMSQ), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_VALUES_PARENTHESIS_R: 'values(' -> type(METHOD_AGGREGATE_VALUES), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_VAR_PARENTHESIS_R: 'var(' -> type(METHOD_AGGREGATE_VAR), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_VARP_PARENTHESIS_R: 'varp(' -> type(METHOD_AGGREGATE_VARP), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_EVERY: 'every=' -> pushMode(GET_SPAN);
//special percX()
COMMAND_MSTATS_MODE_P_VARIABLE: 'p'COMMAND_MSTATS_MODE_INT -> type(METHOD_AGGREGATE_P_VARIABLE), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_PERC_VARIABLE: 'perc'COMMAND_MSTATS_MODE_INT -> type(METHOD_AGGREGATE_PERC_VARIABLE), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_EXACTPERC_VARIABLE: 'exactperc'COMMAND_MSTATS_MODE_INT -> type(METHOD_AGGREGATE_EXACTPERC_VARIABLE), pushMode(AGGREGATION_MODE);
COMMAND_MSTATS_MODE_UPPERPERC_VARIABLE: 'upperperc'COMMAND_MSTATS_MODE_INT -> type(METHOD_AGGREGATE_UPPERPERC_VARIABLE), pushMode(AGGREGATION_MODE);

// characters for string
fragment COMMAND_MSTATS_MODE_CHAR
         :'\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         //|'\u0027' // '
         // |'\u0028' // (
         // |'\u0029' // )
         |'\u002A' // *
         |'\u002B' // +
         //|'\u002C' // ,
         |'\u002D' // -
         |'\u002E' // .
         |'\u002F' // /
         |'\u0030' // 0
         |'\u0031' // 1
         |'\u0032' // 2
         |'\u0033' // 3
         |'\u0034' // 4
         |'\u0035' // 5
         |'\u0036' // 6
         |'\u0037' // 7
         |'\u0038' // 8
         |'\u0039' // 9
         |'\u003A' // :
         |'\u003B' // ;
         // |'\u003C' // <
         |'\u003D' {false}?  // =
         // |'\u003E' // >
         |'\u003F' // ?
         |'\u0040' // MSTATS
         |'\u0041' // A
         |'\u0042' // B
         |'\u0043' // C
         |'\u0044' // D
         |'\u0045' // E
         |'\u0046' // F
         |'\u0047' // G
         |'\u0048' // H
         |'\u0049' // I
         |'\u004A' // J
         |'\u004B' // K
         |'\u004C' // L
         |'\u004D' // M
         |'\u004E' // N
         |'\u004F' // O
         |'\u0050' // P
         |'\u0051' // Q
         |'\u0052' // R
         |'\u0053' // S
         |'\u0054' // T
         |'\u0055' // U
         |'\u0056' // V
         |'\u0057' // W
         |'\u0058' // X
         |'\u0059' // Y
         |'\u005A' // Z
         |'\u005B' {false}? // [
         |'\u005C' // \
         |'\u005D' {false}? // ]
         |'\u005E' // ^
         |'\u005F' // _
         |'\u0060' // `
         |'\u0061' // a 
         |'\u0062' // b
         |'\u0063' // c
         |'\u0064' // d
         |'\u0065' // e
         |'\u0066' // f
         |'\u0067' // g
         |'\u0068' // h
         |'\u0069' // u
         |'\u006A' // j
         |'\u006B' // k
         |'\u006C' // l
         |'\u006D' // m
         |'\u006E' // n
         |'\u006F' // o
         |'\u0070' // p
         |'\u0071' // q
         |'\u0072' // r
         |'\u0073' // s
         |'\u0074' // t
         |'\u0075' // u
         |'\u0076' // v
         |'\u0077' // w
         |'\u0078' // x
         |'\u0079' // y
         |'\u007A' // z
         |'\u007B' // {
         // |'\u007C' // |
         |'\u007D' // }
         |'\u007E' // ~
         |'\u007F'..'\uFFFF' // DEL .. inf
         ;
         
COMMAND_MSTATS_MODE_STRING
        // one or more characters
        : (COMMAND_MSTATS_MODE_CHAR)+ -> type(GET_FIELD_STRING);
        
mode COMMAND_MSTATS_MODE_WHERE_MODE;

// skip
COMMAND_MSTATS_MODE_WHERE_MODE_SPACE: SPACE -> channel(HIDDEN);

// valid for fields
// Reserved words
COMMAND_MSTATS_MODE_WHERE_MODE_TIMEFORMAT: 'timeformat=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_WHERE_MODE_EARLIEST: 'earliest=' -> pushMode(GET_TIME);
COMMAND_MSTATS_MODE_WHERE_MODE_INDEX_EARLIEST: '_index_earliest=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_WHERE_MODE_STARTDAYSAGO: 'stardaysago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_STARTHOURSAGO: 'starthoursago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_STARTMINUTESAGO: 'startminutesago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_STARTMONTHSAGO: 'startmonthsago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_STARTTIME: 'starttime=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_WHERE_MODE_STARTTIMEU: 'starttimeu=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_LATEST: 'latest=' -> pushMode(GET_TIME);
COMMAND_MSTATS_MODE_WHERE_MODE_INDEX_LATEST: '_index_latest=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_WHERE_MODE_ENDDAYSAGO: 'enddaysago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_ENDHOURSAGO: 'endhoursago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_ENDMINUTESAGO: 'endminutesago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_ENDMONTHSAGO: 'endmonthsago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_ENDTIME: 'endtime=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_WHERE_MODE_ENDTIMEU: 'endtimeu=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANDAYS: 'searchtimespandays=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANHOURS: 'searchtimespanhours=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANMINUTES: 'searchtimespanminutes=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANMONHTS: 'searchtimespanmonths=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_MINUTESAGO: 'minutesago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_HOURSAGO: 'hoursago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_DAYSAGO: 'daysago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_MONTHSAGO: 'monthsago=' -> pushMode(GET_INTEGER);
COMMAND_MSTATS_MODE_WHERE_MODE_EVENTTYPE: 'eventtype';
COMMAND_MSTATS_MODE_WHERE_MODE_EVENTTYPETAG: 'eventtypetag';
COMMAND_MSTATS_MODE_WHERE_MODE_HOST: 'host';
COMMAND_MSTATS_MODE_WHERE_MODE_HOSTTAG: 'hosttag';
COMMAND_MSTATS_MODE_WHERE_MODE_INDEX: 'index';
COMMAND_MSTATS_MODE_WHERE_MODE_SAVEDSEARCH: 'savedsearch';
COMMAND_MSTATS_MODE_WHERE_MODE_SOURCE: 'source';
COMMAND_MSTATS_MODE_WHERE_MODE_SOURCETYPE: 'sourcetype';
//special for tstats
COMMAND_TSTATS_MODE_NODENAME: 'nodename=' -> pushMode(GET_STRING);
COMMAND_MSTATS_MODE_WHERE_MODE_TAG: 'tag';
//push to diffrent MODE_MODE's
COMMAND_MSTATS_MODE_WHERE_MODE_AND: 'AND';
COMMAND_MSTATS_MODE_WHERE_MODE_NOT: 'NOT';
COMMAND_MSTATS_MODE_WHERE_MODE_OR: 'OR';
COMMAND_MSTATS_MODE_WHERE_MODE_IN: 'IN';
COMMAND_MSTATS_MODE_WHERE_MODE_BY_BY : ('BY'|'by'|'By') -> popMode;
COMMAND_MSTATS_MODE_WHERE_MODE_GROUPBY : ('GROUPBY'|'groupby') -> popMode;

// charType, common types
COMMAND_MSTATS_MODE_WHERE_MODE_PARENTHESIS_L: '(';
COMMAND_MSTATS_MODE_WHERE_MODE_PARENTHESIS_R: ')';
COMMAND_MSTATS_MODE_WHERE_MODE_BRACKET_L: '[' -> pushMode(COMMAND_MODE);
COMMAND_MSTATS_MODE_WHERE_MODE_BRACKET_R: ']' -> popMode, popMode;
COMMAND_MSTATS_MODE_WHERE_MODE_C_BRACKET_L: '{';
COMMAND_MSTATS_MODE_WHERE_MODE_C_BRACKET_R: '}';
COMMAND_MSTATS_MODE_WHERE_MODE_PIPE: '|' -> pushMode(COMMAND_MODE);
COMMAND_MSTATS_MODE_WHERE_MODE_COMMA: ',';
COMMAND_MSTATS_MODE_WHERE_MODE_COLON: ':';
COMMAND_MSTATS_MODE_WHERE_MODE_DOT: '.';
COMMAND_MSTATS_MODE_WHERE_MODE_EXCLAMATION: '!';
COMMAND_MSTATS_MODE_WHERE_MODE_QUOTE: '" ';
COMMAND_MSTATS_MODE_WHERE_MODE_SINGLE_QUOTE: '\'';
COMMAND_MSTATS_MODE_WHERE_MODE_DOLLAR: '$';
COMMAND_MSTATS_MODE_WHERE_MODE_AT_SIGN: '@';
COMMAND_MSTATS_MODE_WHERE_MODE_MINUS: '-';
COMMAND_MSTATS_MODE_WHERE_MODE_PLUS: '+';
COMMAND_MSTATS_MODE_WHERE_MODE_PERCENT: '%';
COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD: '*';
COMMAND_MSTATS_MODE_WHERE_MODE_SLASH: '/';

// equality
COMMAND_MSTATS_MODE_WHERE_MODE_DEQ: '==';
COMMAND_MSTATS_MODE_WHERE_MODE_EQ: '=';
COMMAND_MSTATS_MODE_WHERE_MODE_NEQ: '!=';
COMMAND_MSTATS_MODE_WHERE_MODE_LT: '<';
COMMAND_MSTATS_MODE_WHERE_MODE_LTE: '<=';
COMMAND_MSTATS_MODE_WHERE_MODE_GT: '>';
COMMAND_MSTATS_MODE_WHERE_MODE_GTE: '>=';

// quotation types
COMMAND_MSTATS_MODE_WHERE_MODE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_STRING_SINGLE_QUOTED);
COMMAND_MSTATS_MODE_WHERE_MODE_SQSTRING: '\'' ( '\\'. | '""' | ~('"'| '\\') )* '\'' -> type(GET_STRING_DOUBLE_QUOTED);

// integers

fragment COMMAND_MSTATS_MODE_WHERE_MODE_CHAR
         :'\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         |'\u0027' // '
         // |'\u0028' // (
         // |'\u0029' // )
         |'\u002A' // *
         |'\u002B' // +
         //|'\u002C' // ,
         |'\u002D' // -
         |'\u002E' // .
         |'\u002F' // /
         |'\u0030' // 0
         |'\u0031' // 1
         |'\u0032' // 2
         |'\u0033' // 3
         |'\u0034' // 4
         |'\u0035' // 5
         |'\u0036' // 6
         |'\u0037' // 7
         |'\u0038' // 8
         |'\u0039' // 9
         |'\u003A' // :
         |'\u003B' // ;
         |'\u003C' // <
         |'\u003D' {false}? // =
         |'\u003E' // >
         |'\u003F' // ?
         |'\u0040' // @
         |'\u0041' // A
         |'\u0042' // B
         |'\u0043' // C
         |'\u0044' // D
         |'\u0045' // E
         |'\u0046' // F
         |'\u0047' // G
         |'\u0048' // H
         |'\u0049' // I
         |'\u004A' // J
         |'\u004B' // K
         |'\u004C' // L
         |'\u004D' // M
         |'\u004E' // N
         |'\u004F' // O
         |'\u0050' // P
         |'\u0051' // Q
         |'\u0052' // R
         |'\u0053' // S
         |'\u0054' // T
         |'\u0055' // U
         |'\u0056' // V
         |'\u0057' // W
         |'\u0058' // X
         |'\u0059' // Y
         |'\u005A' // Z
         // |'\u005B' // [
         |'\u005C' // \
         // |'\u005D' // ]
         |'\u005E' // ^
         |'\u005F' // _
         |'\u0060' // `
         |'\u0061' // a
         |'\u0062' // b
         |'\u0063' // c
         |'\u0064' // d
         |'\u0065' // e
         |'\u0066' // f
         |'\u0067' // g
         |'\u0068' // h
         |'\u0069' // u
         |'\u006A' // j
         |'\u006B' // k
         |'\u006C' // l
         |'\u006D' // m
         |'\u006E' // n
         |'\u006F' // o
         |'\u0070' // p
         |'\u0071' // q
         |'\u0072' // r
         |'\u0073' // s
         |'\u0074' // t
         |'\u0075' // u
         |'\u0076' // v
         |'\u0077' // w
         |'\u0078' // x
         |'\u0079' // y
         |'\u007A' // z
         |'\u007B' // {
         // |'\u007C' // |
         |'\u007D' // }
         |'\u007E' // ~
         |'\u007F'..'\uFFFF' // DEL .. inf
         ;

COMMAND_MSTATS_MODE_WHERE_MODE_STRING
        : (COMMAND_MSTATS_MODE_WHERE_MODE_CHAR)+ -> type(GET_STRING_STRING);

COMMAND_MSTATS_MODE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);
