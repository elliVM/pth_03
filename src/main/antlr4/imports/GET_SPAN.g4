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

lexer grammar GET_SPAN;

GET_FIELD_ANTLR_BUG: 'get_field_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ GET_SPAN ++++++++++++++
mode GET_SPAN;

// skip
GET_SPAN_SPACE: SPACE -> channel(HIDDEN);

// tokens
//SPAN
//not the best way, but I am not sure of other syntax

fragment SPANUNITS: 's' | 'sec' | 'secs' | 'second'| 'seconds'| 'S';
fragment SPANUNITM: 'm' | 'min' | 'mins' | 'minute' | 'minutes'| 'M';
fragment SPANUNITH: 'h' | 'hr' | 'hrs'| 'hour'| 'hours'|'H';
fragment SPANUNITD: 'd' | 'day' | 'days'|'D';
fragment SPANUNITW: 'w' | 'week' | 'weeks'| 'W' ;
fragment SPANUNITMON: 'mon'| 'month' | 'months'|'MON';
fragment SPANUNITSUBS: 'us'|'ms'|'cs'|'ds';
fragment AT_SIGN: '@';
fragment COMMAND_SISPANCHART_MODE_QUARTER: 'quarter';
GET_SPAN_SPANUNIT_DURATION: GET_SPAN_INTEGER(SPANUNITS|SPANUNITM|SPANUNITH|SPANUNITD|SPANUNITW|SPANUNITMON|SPANUNITSUBS) -> popMode;
GET_SPAN_SPANUNIT: (PLUS|MINUS)? (DIGIT)* (SPANUNITW) (AT_SIGN) (DIGIT)* (SPANUNITW) ([0-7])? -> popMode;
GET_SPAN_INTEGER_RANGE: GET_SPAN_INTEGER '-' DIGIT+ -> popMode;
GET_SPAN_SPAN_LOG: ((MINUS)?DIGIT+)'log'((MINUS)?DIGIT+) ->popMode ;
GET_SPAN_SINGLE_QUOTE: '\'' ( '\\'. | ~('\''| '\\'))* '\'' -> popMode;
GET_SPAN_DOUBLE_QUOTE: '"' ('\\'. | ~('"'| '\\'))* '"' -> popMode;

fragment DIGIT: [0-9]+;
fragment DOT: '.';
fragment MINUS: '-';
fragment PLUS: '+';
fragment GET_SPAN_INTEGER: (MINUS)? DIGIT+;
fragment GET_SPAN_DECIMAL: (MINUS)? [0-9]+ DOT? [0-9]+?;
GET_SPAN_INTEGER_INTEGER: ((MINUS)? DIGIT+) -> popMode;


COMMAND_GET_SPAN_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);