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

lexer grammar COMMAND_SENDEMAIL_MODE;

COMMAND_SENDEMAIL_MODE_ANTLR_BUG: 'command_sendemail_mode_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ COMMAND_SENDEMAIL_MODE ++++++++++++++
mode COMMAND_SENDEMAIL_MODE;

// skip
COMMAND_SENDEMAIL_MODE_SPACE: SPACE -> channel(HIDDEN);

// exits
COMMAND_SENDEMAIL_MODE_PIPE: '|' -> type(PIPE), popMode;
COMMAND_SENDEMAIL_MODE_BRACKET_R: ']' -> type(BRACKET_R), popMode, popMode;

// tokens
COMMAND_SENDEMAIL_MODE_FROM: 'from=';
COMMAND_SENDEMAIL_MODE_WIDTH_SORT_COLUMNS : 'width_sort_columns=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_PAPERORIENTATION : 'paperorientation=' -> pushMode(COMMAND_SENDEMAIL_MODE_PAPERORIENTATION_MODE);
COMMAND_SENDEMAIL_MODE_CONTENT_TYPE : 'content_type=' -> pushMode(COMMAND_SENDEMAIL_MODE_CONTENT_TYPE_MODE);
COMMAND_SENDEMAIL_MODE_SENDRESULTS : 'sendresults=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_PAPERSIZE : 'papersize=' -> pushMode(COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE);
COMMAND_SENDEMAIL_MODE_MAXINPUTS : 'maxinputs=' -> pushMode(GET_INTEGER);
COMMAND_SENDEMAIL_MODE_PRIORITY : 'priority=' -> pushMode(COMMAND_SENDEMAIL_MODE_PRIORITY_MODE);
COMMAND_SENDEMAIL_MODE_GRACEFUL : 'graceful=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_USE_TLS : 'use_tls=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_USE_SSL : 'use_ssl=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_SUBJECT : 'subject=' -> pushMode(GET_STRING);
COMMAND_SENDEMAIL_MODE_SENDPDF : 'sendpdf=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_SENDCSV : 'sendcsv=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_PDFVIEW : 'pdfview=' -> pushMode(GET_STRING);
COMMAND_SENDEMAIL_MODE_MESSAGE : 'message=' -> pushMode(GET_STRING);
COMMAND_SENDEMAIL_MODE_MAXTIME : 'maxtime=' -> pushMode(GET_TIME);
COMMAND_SENDEMAIL_MODE_SERVER : 'server=' -> pushMode(GET_STRING);
COMMAND_SENDEMAIL_MODE_INLINE : 'inline=' -> pushMode(GET_BOOLEAN);
COMMAND_SENDEMAIL_MODE_FORMAT : 'format=' -> pushMode(COMMAND_SENDEMAIL_MODE_FORMAT_MODE);
COMMAND_SENDEMAIL_MODE_FOOTER : 'footer=' -> pushMode(GET_STRING);
COMMAND_SENDEMAIL_MODE_COMMA : ',' -> type(COMMA);
COMMAND_SENDEMAIL_MODE_BCC : 'bcc=';
COMMAND_SENDEMAIL_MODE_TO : 'to=';
COMMAND_SENDEMAIL_MODE_CC : 'cc=';
COMMAND_SENDEMAIL_MODE_SINGLE_QUOTE: '\'' ( '\\'. | ~('\''| '\\') )* '\'' -> type(GET_STRING_SINGLE_QUOTED);
COMMAND_SENDEMAIL_MODE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_STRING_DOUBLE_QUOTED);
// characters for string
fragment COMMAND_SENDEMAIL_MODE_CHAR
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
         |'\u003D' {false}? // =
         |'\u003E' // >
         |'\u003F' // ?
         |'\u0040' // SENDEMAIL
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
         
COMMAND_SENDEMAIL_MODE_STRING
        // one or more characters
        : (COMMAND_SENDEMAIL_MODE_CHAR)+ -> type(GET_STRING_STRING);
COMMAND_SENDEMAIL_MODE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);

mode COMMAND_SENDEMAIL_MODE_FORMAT_MODE ;
COMMAND_SENDEMAIL_MODE_FORMAT_MODE_RAW : 'raw' -> popMode;
COMMAND_SENDEMAIL_MODE_FORMAT_MODE_CSV : 'csv' -> popMode;
COMMAND_SENDEMAIL_MODE_FORMAT_MODE_TABLE : 'table' -> popMode;

mode COMMAND_SENDEMAIL_MODE_PRIORITY_MODE ;
COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_LOW: 'low' -> popMode;
COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_HIGH: 'high' -> popMode;
COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_LOWEST : 'lowest' -> popMode;
COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_NORMAL : 'normal' -> popMode;
COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_HIGHEST : 'highest' -> popMode;

mode COMMAND_SENDEMAIL_MODE_CONTENT_TYPE_MODE ;
COMMAND_SENDEMAIL_MODE_CONTENT_TYPE_MODE_PLAIN : 'plain' -> popMode;
COMMAND_SENDEMAIL_MODE_CONTENT_TYPE_MODE_HTML : 'html' -> popMode;

mode COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE ;
COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_LEDGER : 'ledger' -> popMode;
COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_LETTER : 'letter' -> popMode;
COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_LEGAL : 'legal' -> popMode;
COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A2 : 'a2' -> popMode;
COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A3 : 'a3' -> popMode;
COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A4 : 'a4' -> popMode;
COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A5 : 'a5' -> popMode;

mode COMMAND_SENDEMAIL_MODE_PAPERORIENTATION_MODE ;
COMMAND_SENDEMAIL_MODE_PAPERORIENTATION_MODE_LANDSCAPE : 'landscape' -> popMode;
COMMAND_SENDEMAIL_MODE_PAPERORIENTATION_MODE_PORTRAIT : 'portrait' -> popMode;