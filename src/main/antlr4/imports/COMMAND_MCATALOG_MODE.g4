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

lexer grammar COMMAND_MCATALOG_MODE;

COMMAND_MCATALOG_MODE_ANTLR_BUG: 'command_mcatalog_mode_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ COMMAND_MCATALOG_MODE ++++++++++++++
mode COMMAND_MCATALOG_MODE;

// skip
COMMAND_MCATALOG_MODE_SPACE: SPACE -> channel(HIDDEN);

// exits
COMMAND_MCATALOG_MODE_PIPE: '|' -> type(PIPE), popMode;
COMMAND_MCATALOG_MODE_BRACKET_R: ']' -> type(BRACKET_R), popMode, popMode;

// tokens
COMMAND_MCATALOG_MODE_WHERE: ('where' | 'WHERE') -> pushMode(COMMAND_MCATALOG_MODE_WHERE_MODE);
COMMAND_MCATALOG_MODE_PARENTHESIS_R : ')';
COMMAND_MCATALOG_MODE_PARENTHESIS_L : '(';
COMMAND_MCATALOG_MODE_PRESTATS : 'prestats=' -> pushMode(GET_BOOLEAN);
COMMAND_MCATALOG_MODE_GROUPBY : ('GROUPBY'|'groupby') -> pushMode(GET_FIELD);
COMMAND_MCATALOG_MODE_APPEND : 'append=' -> pushMode(GET_BOOLEAN);
COMMAND_MCATALOG_MODE_VALUES : 'values';
COMMAND_MCATALOG_MODE_COMMA : ',' -> type(COMMA);
COMMAND_MCATALOG_MODE_BY : ('BY'|'by'|'By') -> pushMode(GET_FIELD);
COMMAND_MCATALOG_MODE_AS : 'as' -> pushMode(GET_FIELD);

COMMAND_MCATALOG_MODE_SINGLE_QUOTE:  '\'' ( '\\'. | ~('\''| '\\') )* '\'' -> type(GET_FIELD_SINGLE_QUOTED);
COMMAND_MCATALOG_MODE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_FIELD_DOUBLE_QUOTED);
// characters for string
fragment COMMAND_MCATALOG_MODE_CHAR
         :'\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         // |'\u0027' // '
         // |'\u0028' // (
         // |'\u0029' // )
         |'\u002A' // *
         |'\u002B' // +
         // |'\u002C' // ,
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
         // |'\u003D' // =
         |'\u003E' // >
         |'\u003F' // ?
         |'\u0040' // MCATALOG
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

COMMAND_MCATALOG_MODE_STRING
        // one or more characters
        : (COMMAND_MCATALOG_MODE_CHAR)+  -> type(GET_FIELD_STRING);

mode COMMAND_MCATALOG_MODE_WHERE_MODE;

// skip
COMMAND_MCATALOG_MODE_WHERE_MODE_SPACE: SPACE -> channel(HIDDEN);

// valid for fields
// Reserved words
COMMAND_MCATALOG_MODE_WHERE_MODE_TIMEFORMAT: 'timeformat=' -> pushMode(GET_STRING);
COMMAND_MCATALOG_MODE_WHERE_MODE_EARLIEST: 'earliest=' -> pushMode(GET_TIME);
COMMAND_MCATALOG_MODE_WHERE_MODE_INDEX_EARLIEST: '_index_earliest=' -> pushMode(GET_STRING);
COMMAND_MCATALOG_MODE_WHERE_MODE_STARTDAYSAGO: 'stardaysago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_STARTHOURSAGO: 'starthoursago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_STARTMINUTESAGO: 'startminutesago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_STARTMONTHSAGO: 'startmonthsago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_STARTTIME: 'starttime=' -> pushMode(GET_STRING);
COMMAND_MCATALOG_MODE_WHERE_MODE_STARTTIMEU: 'starttimeu=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_LATEST: 'latest=' -> pushMode(GET_TIME);
COMMAND_MCATALOG_MODE_WHERE_MODE_INDEX_LATEST: '_index_latest=' -> pushMode(GET_STRING);
COMMAND_MCATALOG_MODE_WHERE_MODE_ENDDAYSAGO: 'enddaysago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_ENDHOURSAGO: 'endhoursago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_ENDMINUTESAGO: 'endminutesago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_ENDMONTHSAGO: 'endmonthsago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_ENDTIME: 'endtime=' -> pushMode(GET_STRING);
COMMAND_MCATALOG_MODE_WHERE_MODE_ENDTIMEU: 'endtimeu=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANDAYS: 'searchtimespandays=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANHOURS: 'searchtimespanhours=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANMINUTES: 'searchtimespanminutes=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANMONHTS: 'searchtimespanmonths=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_MINUTESAGO: 'minutesago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_HOURSAGO: 'hoursago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_DAYSAGO: 'daysago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_MONTHSAGO: 'monthsago=' -> pushMode(GET_INTEGER);
COMMAND_MCATALOG_MODE_WHERE_MODE_EVENTTYPE: 'eventtype';
COMMAND_MCATALOG_MODE_WHERE_MODE_EVENTTYPETAG: 'eventtypetag';
COMMAND_MCATALOG_MODE_WHERE_MODE_HOST: 'host';
COMMAND_MCATALOG_MODE_WHERE_MODE_HOSTTAG: 'hosttag';
COMMAND_MCATALOG_MODE_WHERE_MODE_INDEX: 'index';
COMMAND_MCATALOG_MODE_WHERE_MODE_SAVEDSEARCH: 'savedsearch';
COMMAND_MCATALOG_MODE_WHERE_MODE_SOURCE: 'source';
COMMAND_MCATALOG_MODE_WHERE_MODE_SOURCETYPE: 'sourcetype';
//special for tstats
COMMAND_TSTATS_MODE_NODENAME: 'nodename=' -> pushMode(GET_STRING);
COMMAND_MCATALOG_MODE_WHERE_MODE_TAG: 'tag';
//push to diffrent MODE_MODE's
COMMAND_MCATALOG_MODE_WHERE_MODE_AND: 'AND';
COMMAND_MCATALOG_MODE_WHERE_MODE_NOT: 'NOT';
COMMAND_MCATALOG_MODE_WHERE_MODE_OR: 'OR';
COMMAND_MCATALOG_MODE_WHERE_MODE_IN: 'IN';
COMMAND_MCATALOG_MODE_WHERE_MODE_BY_BY : ('BY'|'by'|'By') -> popMode;
COMMAND_MCATALOG_MODE_WHERE_MODE_GROUPBY : ('GROUPBY'|'groupby') -> popMode;

// charType, common types
COMMAND_MCATALOG_MODE_WHERE_MODE_PARENTHESIS_L: '(';
COMMAND_MCATALOG_MODE_WHERE_MODE_PARENTHESIS_R: ')';
COMMAND_MCATALOG_MODE_WHERE_MODE_BRACKET_L: '[' -> pushMode(COMMAND_MODE);
COMMAND_MCATALOG_MODE_WHERE_MODE_BRACKET_R: ']' -> popMode, popMode;
COMMAND_MCATALOG_MODE_WHERE_MODE_C_BRACKET_L: '{';
COMMAND_MCATALOG_MODE_WHERE_MODE_C_BRACKET_R: '}';
COMMAND_MCATALOG_MODE_WHERE_MODE_PIPE: '|' -> pushMode(COMMAND_MODE);
COMMAND_MCATALOG_MODE_WHERE_MODE_COMMA: ',';
COMMAND_MCATALOG_MODE_WHERE_MODE_COLON: ':';
COMMAND_MCATALOG_MODE_WHERE_MODE_DOT: '.';
COMMAND_MCATALOG_MODE_WHERE_MODE_EXCLAMATION: '!';
COMMAND_MCATALOG_MODE_WHERE_MODE_QUOTE: '" ';
COMMAND_MCATALOG_MODE_WHERE_MODE_SINGLE_QUOTE: '\'';
COMMAND_MCATALOG_MODE_WHERE_MODE_DOLLAR: '$';
COMMAND_MCATALOG_MODE_WHERE_MODE_AT_SIGN: '@';

COMMAND_MCATALOG_MODE_WHERE_MODE_MINUS: '-';
COMMAND_MCATALOG_MODE_WHERE_MODE_PLUS: '+';
COMMAND_MCATALOG_MODE_WHERE_MODE_PERCENT: '%';
COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD: '*';
COMMAND_MCATALOG_MODE_WHERE_MODE_SLASH: '/';



// equality
COMMAND_MCATALOG_MODE_WHERE_MODE_DEQ: '==';
COMMAND_MCATALOG_MODE_WHERE_MODE_EQ: '=';
COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ: '!=';
COMMAND_MCATALOG_MODE_WHERE_MODE_LT: '<';
COMMAND_MCATALOG_MODE_WHERE_MODE_LTE: '<=';
COMMAND_MCATALOG_MODE_WHERE_MODE_GT: '>';
COMMAND_MCATALOG_MODE_WHERE_MODE_GTE: '>=';

// quotation types
COMMAND_MCATALOG_MODE_WHERE_MODE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_STRING_SINGLE_QUOTED);
COMMAND_MCATALOG_MODE_WHERE_MODE_SQSTRING: '\'' ( '\\'. | '""' | ~('"'| '\\') )* '\'' -> type(GET_STRING_DOUBLE_QUOTED);

// integers

fragment COMMAND_MCATALOG_MODE_WHERE_MODE_CHAR
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
         |'\u007C' // |
         |'\u007D' // }
         |'\u007E' // ~
         |'\u007F'..'\uFFFF' // DEL .. inf
         ;

COMMAND_MCATALOG_MODE_WHERE_MODE_STRING
        : (COMMAND_MCATALOG_MODE_WHERE_MODE_CHAR)+ -> type(GET_STRING_STRING);


COMMAND_MCATALOG_MODE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);
