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

lexer grammar COMMAND_CHART_MODE;

COMMAND_CHART_MODE_ANTLR_BUG: 'command_chart_mode_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ COMMAND_CHART_MODE ++++++++++++++
mode COMMAND_CHART_MODE;

// http://antlr.1301665.n2.nabble.com/Reuse-of-same-token-in-multiple-lexer-modes-td7578956.html

// skip
COMMAND_CHART_MODE_SPACE: SPACE -> channel(HIDDEN);

// comments
COMMAND_CHART_MODE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);

// exits
COMMAND_CHART_MODE_PIPE: '|' -> type(PIPE), popMode;
COMMAND_CHART_MODE_BRACKET_R: ']' -> type(BRACKET_R), popMode, popMode;

// tokens
// alternative would be to enter sparkline mode
COMMAND_CHART_MODE_SPARKLINE: 'sparkline(' -> pushMode(COMMAND_CHART_SUBMODE_SPARKLINE);
COMMAND_CHART_MODE_PARENTHESIS_L: '(';
COMMAND_CHART_MODE_PARENTHESIS_R: ')';
COMMAND_CHART_MODE_BY: ('BY'|'by'|'By') -> pushMode(GET_FIELD);
COMMAND_CHART_MODE_AS: ('as'|'AS'|'As') -> pushMode(GET_FIELD);
COMMAND_CHART_MODE_EVAL: 'eval';
COMMAND_CHART_MODE_OVER: ('OVER'|'over'|'Over') ->pushMode(GET_FIELD);
COMMAND_CHART_MODE_WHERE: ('where' | 'WHERE') ;
COMMAND_CHART_MODE_COMMA: ',' -> type(COMMA);


// FIXME
// tokens from sparklineAggregationInstruction second alternative

//tc options
COMMAND_CHART_MODE_USENULL : 'usenull=' -> pushMode(GET_BOOLEAN);
COMMAND_CHART_MODE_USEOTHER : 'useother=' -> pushMode(GET_BOOLEAN);
COMMAND_CHART_MODE_NULLSTR : 'nullstr=' -> pushMode(GET_STRING);
COMMAND_CHART_MODE_OTHERSTR : 'otherstr=' -> pushMode(GET_STRING);
COMMAND_CHART_MODE_ALIGNTIME : 'aligntime=' -> pushMode(GET_TIME);
COMMAND_CHART_MODE_START : 'start=' -> pushMode(GET_NUMBER);
COMMAND_CHART_MODE_STDEVP : 'stdevp';
COMMAND_CHART_MODE_FORMAT : 'format=' -> pushMode(GET_STRING) ;
COMMAND_CHART_MODE_NOTIN : 'notin';
COMMAND_CHART_MODE_RANGE : 'range';
COMMAND_CHART_MODE_SUMSQ : 'sumsq';
COMMAND_CHART_MODE_LIMIT : 'limit=' -> pushMode(COMMAND_CHART_SUBMODE_LIMIT_MODE);
COMMAND_CHART_MODE_TOP: 'top';
COMMAND_CHART_MODE_BOTTOM: 'bottom';
COMMAND_CHART_MODE_SPAN : 'span=' -> pushMode(GET_SPAN);
COMMAND_CHART_MODE_BINS : 'bins=' -> pushMode(GET_INTEGER);
COMMAND_CHART_MODE_VARP : 'varp';
COMMAND_CHART_MODE_MEAN : 'mean';
COMMAND_CHART_MODE_CONT : 'cont=' -> pushMode(GET_BOOLEAN);
COMMAND_CHART_MODE_END : 'end=' -> pushMode(GET_NUMBER);
COMMAND_CHART_MODE_DEDUP_SPLITVALS : 'dedup_splitvals=' -> pushMode(GET_BOOLEAN);
COMMAND_CHART_MODE_MAX : 'max';
COMMAND_CHART_MODE_AVG : 'avg';
COMMAND_CHART_MODE_SEP : 'sep=' -> pushMode(GET_STRING);
COMMAND_CHART_MODE_AGG : 'agg=';
COMMAND_CHART_MODE_GT : '>' -> pushMode(GET_NUMBER) ;
COMMAND_CHART_MODE_LT : '<' -> pushMode(GET_NUMBER) ;
COMMAND_CHART_MODE_MINUS: '-';
COMMAND_CHART_MODE_DC : 'dc';
COMMAND_CHART_MODE_Or : 'OR';
COMMAND_CHART_MODE_And : 'AND';
COMMAND_CHART_MODE_Xor : 'XOR';

COMMAND_CHART_MODE_C: 'c';
COMMAND_CHART_MODE_STDEV: 'stdev';
COMMAND_CHART_MODE_VAR: 'var';
COMMAND_CHART_MODE_SUM: 'sum';
COMMAND_CHART_MODE_MIN: 'min';
COMMAND_CHART_MODE_INT: DIGIT+;
fragment DIGIT: [0-99];

// aggregateMethod chart
COMMAND_CHART_MODE_EVAL_PARENTHESIS_R: 'eval(' -> pushMode(EVAL_LANGUAGE_MODE);
COMMAND_CHART_MODE_AVG_PARENTHESIS_R: 'avg(' -> type(METHOD_AGGREGATE_AVG), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_MEAN_PARENTHESIS_R: 'mean(' -> type(METHOD_AGGREGATE_MEAN), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_C_PARENTHESIS_R: 'c(' -> type(METHOD_AGGREGATE_C), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_COUNT_PARENTHESIS_R: 'count(' -> type(METHOD_AGGREGATE_COUNT_B), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_COUNT : 'count' -> type(METHOD_AGGREGATE_COUNT);
COMMAND_CHART_MODE_DC_PARENTHESIS_R: 'dc(' -> type(METHOD_AGGREGATE_DC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_DISTINCT_COUNT_PARENTHESIS_R: 'distinct_count(' -> type(METHOD_AGGREGATE_DISTINCT_COUNT), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_EARLIEST_PARENTHESIS_R: 'earliest(' -> type(METHOD_AGGREGATE_EARLIEST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_EARLIEST_TIME_PARENTHESIS_R: 'earliest_time(' -> type(METHOD_AGGREGATE_EARLIEST_TIME), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_ESTDC_PARENTHESIS_R: 'estdc(' -> type(METHOD_AGGREGATE_ESTDC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_ESTDC_ERROR_PARENTHESIS_R: 'estdc_error(' -> type(METHOD_AGGREGATE_ESTDC_ERROR), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_FIRST_PARENTHESIS_R: 'first(' -> type(METHOD_AGGREGATE_FIRST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_LAST_PARENTHESIS_R: 'last(' -> type(METHOD_AGGREGATE_LAST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_LATEST_PARENTHESIS_R: 'latest(' -> type(METHOD_AGGREGATE_LATEST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_LATEST_TIME_PARENTHESIS_R: 'latest_time(' -> type(METHOD_AGGREGATE_LATEST_TIME), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_LIST_PARENTHESIS_R: 'list(' -> type(METHOD_AGGREGATE_LIST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_MAX_PARENTHESIS_R: 'max(' -> type(METHOD_AGGREGATE_MAX), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_MEDIAN_PARENTHESIS_R: 'median(' -> type(METHOD_AGGREGATE_MEDIAN), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_MIN_PARENTHESIS_R: 'min(' -> type(METHOD_AGGREGATE_MIN), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_MODE_PARENTHESIS_R: 'mode(' -> type(METHOD_AGGREGATE_MODE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_P_PARENTHESIS_R: 'p(' -> type(METHOD_AGGREGATE_P), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_PERC_PARENTHESIS_R: 'perc(' -> type(METHOD_AGGREGATE_PERC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_EXACTPERC_PARENTHESIS_R: 'exactperc(' -> type(METHOD_AGGREGATE_EXACTPERC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_UPPERPERC_PARENTHESIS_R: 'upperperc(' -> type(METHOD_AGGREGATE_UPPERPERC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_PERCINT_PARENTHESIS_R: 'percint(' -> type(METHOD_AGGREGATE_PERCINT), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_RANGE_PARENTHESIS_R: 'range(' -> type(METHOD_AGGREGATE_RANGE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_RATE_PARENTHESIS_R: 'rate(' -> type(METHOD_AGGREGATE_RATE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_STDEV_PARENTHESIS_R: 'stdev(' -> type(METHOD_AGGREGATE_STDEV), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_STDEVP_PARENTHESIS_R: 'stdevp(' -> type(METHOD_AGGREGATE_STDEVP), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_SUM_PARENTHESIS_R: 'sum(' -> type(METHOD_AGGREGATE_SUM), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_SUMSQ_PARENTHESIS_R: 'sumsq(' -> type(METHOD_AGGREGATE_SUMSQ), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_VALUES_PARENTHESIS_R: 'values(' -> type(METHOD_AGGREGATE_VALUES), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_VAR_PARENTHESIS_R: 'var(' -> type(METHOD_AGGREGATE_VAR), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_VARP_PARENTHESIS_R: 'varp(' -> type(METHOD_AGGREGATE_VARP), pushMode(AGGREGATION_MODE);
//special percX()
COMMAND_CHART_MODE_P_VARIABLE: 'p'COMMAND_CHART_MODE_INT -> type(METHOD_AGGREGATE_P_VARIABLE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_PERC_VARIABLE: 'perc'COMMAND_CHART_MODE_INT -> type(METHOD_AGGREGATE_PERC_VARIABLE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_EXACTPERC_VARIABLE: 'exactperc'COMMAND_CHART_MODE_INT -> type(METHOD_AGGREGATE_EXACTPERC_VARIABLE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_MODE_UPPERPERC_VARIABLE: 'upperperc'COMMAND_CHART_MODE_INT -> type(METHOD_AGGREGATE_UPPERPERC_VARIABLE), pushMode(AGGREGATION_MODE);
//no special agg to chart

// characters for string
COMMAND_CHART_MODE_CHAR
         : (
         '\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         //|'\u0027' // '
         |'\u0028' {false}? // (
         |'\u0029' {false}? // )
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
         |'\u003D' {false}? // =
         // |'\u003E' // >
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
         );

COMMAND_CHART_MODE_STRING_MATCH
        // two or more characters, CHAR_MATCH catches shorter ones
        // following still is legal | eval a(="a+a"
        // use lexical modes?
        : (COMMAND_CHART_MODE_CHAR)+ -> type(GET_FIELD_STRING);

COMMAND_CHART_MODE_SQSTRING: '\'' ( '\\'. | '\'\'' | ~('\''| '\\') )* '\'' -> type(GET_FIELD_SINGLE_QUOTED);
COMMAND_CHART_MODE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_FIELD_DOUBLE_QUOTED);

// this seems pretty horrible way of doing it but because a comma is a comman and perhaps in field name
mode COMMAND_CHART_SUBMODE_SPARKLINE;
COMMAND_CHART_SUBMODE_SPARKLINE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);
COMMAND_CHART_SUBMODE_SPARKLINE_PARENTHESIS_R: ')' -> popMode;
COMMAND_CHART_SUBMODE_SPARKLINE_MINUS: '-' -> type(COMMAND_CHART_MODE_MINUS);
COMMAND_CHART_SUBMODE_SPARKLINE_INTEGER: COMMAND_CHART_SUBMODE_SPARKLINE_MINUS? DIGI;
//integer
fragment DIGI: [0-9]+;
COMMAND_CHART_SUBMODE_SPARKLINE_COUNT: 'count' -> type(METHOD_AGGREGATE_COUNT);
COMMAND_CHART_SUBMODE_SPARKLINE_AVG_PARENTHESIS_R: 'avg(' -> type(METHOD_AGGREGATE_AVG), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_MEAN_PARENTHESIS_R: 'mean(' -> type(METHOD_AGGREGATE_MEAN), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_C_PARENTHESIS_R: 'c(' -> type(METHOD_AGGREGATE_C), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_COUNT_PARENTHESIS_R: 'count(' -> type(METHOD_AGGREGATE_COUNT_B), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_DC_PARENTHESIS_R: 'dc(' -> type(METHOD_AGGREGATE_DC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_DISTINCT_COUNT_PARENTHESIS_R: 'distinct_count(' -> type(METHOD_AGGREGATE_DISTINCT_COUNT), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_EARLIEST_PARENTHESIS_R: 'earliest(' -> type(METHOD_AGGREGATE_EARLIEST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_EARLIEST_TIME_PARENTHESIS_R: 'earliest_time(' -> type(METHOD_AGGREGATE_EARLIEST_TIME), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_ESTDC_PARENTHESIS_R: 'estdc(' -> type(METHOD_AGGREGATE_ESTDC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_ESTDC_ERROR_PARENTHESIS_R: 'estdc_error(' -> type(METHOD_AGGREGATE_ESTDC_ERROR), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_FIRST_PARENTHESIS_R: 'first(' -> type(METHOD_AGGREGATE_FIRST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_LAST_PARENTHESIS_R: 'last(' -> type(METHOD_AGGREGATE_LAST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_LATEST_PARENTHESIS_R: 'latest(' -> type(METHOD_AGGREGATE_LATEST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_LATEST_TIME_PARENTHESIS_R: 'latest_time(' -> type(METHOD_AGGREGATE_LATEST_TIME), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_LIST_PARENTHESIS_R: 'list(' -> type(METHOD_AGGREGATE_LIST), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_MAX_PARENTHESIS_R: 'max(' -> type(METHOD_AGGREGATE_MAX), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_MEDIAN_PARENTHESIS_R: 'median(' -> type(METHOD_AGGREGATE_MEDIAN), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_MIN_PARENTHESIS_R: 'min(' -> type(METHOD_AGGREGATE_MIN), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_MODE_PARENTHESIS_R: 'mode(' -> type(METHOD_AGGREGATE_MODE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_P_PARENTHESIS_R: 'p(' -> type(METHOD_AGGREGATE_P), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_PERC_PARENTHESIS_R: 'perc(' -> type(METHOD_AGGREGATE_PERC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_EXACTPERC_PARENTHESIS_R: 'exactperc(' -> type(METHOD_AGGREGATE_EXACTPERC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_UPPERPERC_PARENTHESIS_R: 'upperperc(' -> type(METHOD_AGGREGATE_UPPERPERC), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_PERCINT_PARENTHESIS_R: 'percint(' -> type(METHOD_AGGREGATE_PERCINT), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_RANGE_PARENTHESIS_R: 'range(' -> type(METHOD_AGGREGATE_RANGE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_RATE_PARENTHESIS_R: 'rate(' -> type(METHOD_AGGREGATE_RATE), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_STDEV_PARENTHESIS_R: 'stdev(' -> type(METHOD_AGGREGATE_STDEV), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_STDEVP_PARENTHESIS_R: 'stdevp(' -> type(METHOD_AGGREGATE_STDEVP), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_SUM_PARENTHESIS_R: 'sum(' -> type(METHOD_AGGREGATE_SUM), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_SUMSQ_PARENTHESIS_R: 'sumsq(' -> type(METHOD_AGGREGATE_SUMSQ), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_VALUES_PARENTHESIS_R: 'values(' -> type(METHOD_AGGREGATE_VALUES), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_VAR_PARENTHESIS_R: 'var(' -> type(METHOD_AGGREGATE_VAR), pushMode(AGGREGATION_MODE);
COMMAND_CHART_SUBMODE_SPARKLINE_VARP_PARENTHESIS_R: 'varp(' -> type(METHOD_AGGREGATE_VARP), pushMode(AGGREGATION_MODE);

mode COMMAND_CHART_SUBMODE_LIMIT_MODE;
fragment COMMAND_CHART_SUBMODE_LIMIT_MODE_BOTTOM : 'bottom';
fragment COMMAND_CHART_SUBMODE_LIMIT_MODE_TOP : 'top';
COMMAND_CHART_SUBMODE_LIMIT_MODE_TOP_INT:COMMAND_CHART_SUBMODE_LIMIT_MODE_TOP? INTEGER -> popMode;
COMMAND_CHART_SUBMODE_LIMIT_MODE_BOTTOM_INT: COMMAND_CHART_SUBMODE_LIMIT_MODE_BOTTOM? INTEGER -> popMode;
fragment DIGIT2: [0-9]+;
fragment MINUS2: '-';
fragment INTEGER: MINUS2? DIGIT2;
COMMAND_CHART_SUBMODE_LIMIT_MODE_INTEGER: MINUS2? DIGIT2 -> popMode;