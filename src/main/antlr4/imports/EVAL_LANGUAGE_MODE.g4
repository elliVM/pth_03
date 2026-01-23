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

lexer grammar EVAL_LANGUAGE_MODE;

EVAL_LANGUAGE_MODE_ANTLR_BUG: 'eval_language_mode_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ EVAL_LANGUAGE_MODE ++++++++++++++
mode EVAL_LANGUAGE_MODE;

// http://antlr.1301665.n2.nabble.com/Reuse-of-same-token-in-multiple-lexer-modes-td7578956.html

// there are three modes for | eval field=<eval>+<eval>(, field2=<eval>)
// COMMAND_EVAL_MODE for recursing <eval> 
// COMMAND_EVAL_SUBMODE_BASE for <eval>+<eval> which is the same as COMMAND_EVAL_MODE but pushes to COMMAND_EVAL_SUBMODE_FIELD on ','.
// This mode differs from COMMAND_EVAL_MODE as it uses comma for pushing a new mode, and therefore does not allow field=1,2
// but as it pushes new eval modes on ( and pops with ), pow(2,2)
// COMMAND_EVAL_SUBMODE_FIELD which matches fields (field, field2) and is popped on =

// comments
EVAL_LANGUAGE_MODE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);

// skip
EVAL_LANGUAGE_MODE_SPACE: SPACE -> channel(HIDDEN);

// exits
EVAL_LANGUAGE_MODE_PIPE: '|' -> type(PIPE), popMode;
COMMAND_WHERE_MODE_BRACKET_R: ']' -> type(BRACKET_R), popMode, popMode;

// tokens
EVAL_LANGUAGE_MODE_SPACE_MODE: SPACE -> channel(HIDDEN);
EVAL_LANGUAGE_MODE_PARENTHESIS_L: '(' -> pushMode(EVAL_LANGUAGE_MODE);
EVAL_LANGUAGE_MODE_PARENTHESIS_R: ')' -> popMode;
EVAL_LANGUAGE_MODE_PARENTHESIS_R_Q: '")"' -> popMode;
EVAL_LANGUAGE_MODE_COMMA: ',';
EVAL_LANGUAGE_MODE_DEQ: DEQ;
EVAL_LANGUAGE_MODE_EQ: EQ;
EVAL_LANGUAGE_MODE_EQUALITY: EQ EQ;
EVAL_LANGUAGE_MODE_NEQ: '!=';
EVAL_LANGUAGE_MODE_LT: LT;
EVAL_LANGUAGE_MODE_LTE: LTE;
EVAL_LANGUAGE_MODE_GT: GT;
EVAL_LANGUAGE_MODE_GTE: GTE;

fragment EVAL_LANGUAGE_MODE_DIGIT: [0-9];
EVAL_LANGUAGE_MODE_INTEGER: (EVAL_LANGUAGE_MODE_MINUS)? EVAL_LANGUAGE_MODE_DIGIT+;
EVAL_LANGUAGE_MODE_DECIMAL: (EVAL_LANGUAGE_MODE_MINUS)? [0-9]+ EVAL_LANGUAGE_MODE_DOT [0-9]+;
EVAL_LANGUAGE_MODE_DOT: '.';
EVAL_LANGUAGE_MODE_AND: ('AND' | 'and');
EVAL_LANGUAGE_MODE_OR: ('OR' | 'or');
EVAL_LANGUAGE_MODE_XOR: ('XOR' | 'xor');
EVAL_LANGUAGE_MODE_WILDCARD: WILDCARD;
EVAL_LANGUAGE_MODE_PLUS: PLUS;
EVAL_LANGUAGE_MODE_MINUS: MINUS;
EVAL_LANGUAGE_MODE_SLASH: SLASH;
EVAL_LANGUAGE_MODE_Like: 'LIKE';
EVAL_LANGUAGE_MODE_PERCENT: '%';
EVAL_LANGUAGE_MODE_EXCLAMATION: '!';
EVAL_LANGUAGE_MODE_NOT: ('NOT'|'not'|'Not');

//eval-functions
EVAL_LANGUAGE_MODE_ABS: 'abs';
EVAL_LANGUAGE_MODE_ACOS: 'acos';
EVAL_LANGUAGE_MODE_ACOSH: 'acosh';
EVAL_LANGUAGE_MODE_ASIN: 'asin';
EVAL_LANGUAGE_MODE_ASINH: 'asinh';
EVAL_LANGUAGE_MODE_ATAN: 'atan';
EVAL_LANGUAGE_MODE_ATAN2: 'atan2';
EVAL_LANGUAGE_MODE_ATANH: 'atanh';
EVAL_LANGUAGE_MODE_AVG: 'avg';
EVAL_LANGUAGE_MODE_CASE: 'case';
EVAL_LANGUAGE_MODE_CEILING: ('ceil'|'ceiling');
EVAL_LANGUAGE_MODE_CIDRMATCH: 'cidrmatch';
EVAL_LANGUAGE_MODE_COALESCE: 'coalesce';
EVAL_LANGUAGE_MODE_COMMANDS: 'commands';
EVAL_LANGUAGE_MODE_COS: 'cos';
EVAL_LANGUAGE_MODE_COSH: 'cosh';
EVAL_LANGUAGE_MODE_EVAL: 'eval';
EVAL_LANGUAGE_MODE_EXACT: 'exact';
EVAL_LANGUAGE_MODE_EXP: 'exp';
EVAL_LANGUAGE_MODE_FALSE: 'false';
EVAL_LANGUAGE_MODE_FLOOR: 'floor';
EVAL_LANGUAGE_MODE_HYPOT: 'hypot';
EVAL_LANGUAGE_MODE_IF: 'if';
EVAL_LANGUAGE_MODE_IFNULL: 'ifnull';
EVAL_LANGUAGE_MODE_IN: 'in';
EVAL_LANGUAGE_MODE_ISBOOL: 'isbool';
EVAL_LANGUAGE_MODE_ISINT: 'isint';
EVAL_LANGUAGE_MODE_ISNOTNULL: 'isnotnull';
EVAL_LANGUAGE_MODE_ISNULL: 'isnull';
EVAL_LANGUAGE_MODE_ISNUM: 'isnum';
EVAL_LANGUAGE_MODE_ISSTR: 'isstr';
EVAL_LANGUAGE_MODE_JSON_VALID: 'json_valid';
EVAL_LANGUAGE_MODE_LEN: 'len';
EVAL_LANGUAGE_MODE_LIKE: 'like';
EVAL_LANGUAGE_MODE_LN: 'ln';
EVAL_LANGUAGE_MODE_LOG: 'log';
EVAL_LANGUAGE_MODE_LOWER: 'lower';
EVAL_LANGUAGE_MODE_LTRIM: 'ltrim';
EVAL_LANGUAGE_MODE_MATCH: 'match';
EVAL_LANGUAGE_MODE_MAX: 'max';
EVAL_LANGUAGE_MODE_MD5: 'md5';
EVAL_LANGUAGE_MODE_MIN: 'min';
EVAL_LANGUAGE_MODE_MVAPPEND: 'mvappend';
EVAL_LANGUAGE_MODE_MVCOUNT: 'mvcount';
EVAL_LANGUAGE_MODE_MVDEDUP: 'mvdedup';
EVAL_LANGUAGE_MODE_MVFILTER: 'mvfilter';
EVAL_LANGUAGE_MODE_MVFIND: 'mvfind';
EVAL_LANGUAGE_MODE_MVINDEX: 'mvindex';
EVAL_LANGUAGE_MODE_MVJOIN: 'mvjoin';
EVAL_LANGUAGE_MODE_MVRANGE: 'mvrange';
EVAL_LANGUAGE_MODE_MVSORT: 'mvsort';
EVAL_LANGUAGE_MODE_MVZIP: 'mvzip';
EVAL_LANGUAGE_MODE_NOW: 'now';
EVAL_LANGUAGE_MODE_NULL: 'null';
EVAL_LANGUAGE_MODE_NULLIF: 'nullif';
EVAL_LANGUAGE_MODE_PI: 'pi';
EVAL_LANGUAGE_MODE_PRINTF: 'printf';
EVAL_LANGUAGE_MODE_POW: 'pow';
EVAL_LANGUAGE_MODE_RANDOM: 'random';
EVAL_LANGUAGE_MODE_RELATIVE_TIME: 'relative_time';
EVAL_LANGUAGE_MODE_REPLACE: 'replace';
EVAL_LANGUAGE_MODE_ROUND: 'round';
EVAL_LANGUAGE_MODE_RTRIM: 'rtrim';
EVAL_LANGUAGE_MODE_SEARCHMATCH: 'searchmatch';
EVAL_LANGUAGE_MODE_SHA1: 'sha1';
EVAL_LANGUAGE_MODE_SHA256: 'sha256';
EVAL_LANGUAGE_MODE_SHA512: 'sha512';
EVAL_LANGUAGE_MODE_SIGFIG: 'sigfig';
EVAL_LANGUAGE_MODE_SIN: 'sin';
EVAL_LANGUAGE_MODE_SINH: 'sinh';
EVAL_LANGUAGE_MODE_SPATH: 'spath';
EVAL_LANGUAGE_MODE_SPLIT: 'split';
EVAL_LANGUAGE_MODE_SQRT: 'sqrt';
EVAL_LANGUAGE_MODE_STRFTIME: 'strftime';
EVAL_LANGUAGE_MODE_STRPTIME: 'strptime';
EVAL_LANGUAGE_MODE_SUBSTR: 'substr';
EVAL_LANGUAGE_MODE_SUM: 'sum';
EVAL_LANGUAGE_MODE_TAN: 'tan';
EVAL_LANGUAGE_MODE_TANH: 'tanh';
EVAL_LANGUAGE_MODE_TIME: 'time';
EVAL_LANGUAGE_MODE_TONUMBER: 'tonumber';
EVAL_LANGUAGE_MODE_TOSTRING: 'tostring';
EVAL_LANGUAGE_MODE_TRIM: 'trim';
EVAL_LANGUAGE_MODE_TRUE: 'true';
EVAL_LANGUAGE_MODE_TYPEOF: 'typeof';
EVAL_LANGUAGE_MODE_UPPER: 'upper';
EVAL_LANGUAGE_MODE_URLDECODE: 'urldecode';
EVAL_LANGUAGE_MODE_VALIDATE: 'validate';
EVAL_LANGUAGE_MODE_JSON_OBJECT: 'json_object';

// characters for string
fragment EVAL_LANGUAGE_MODE_CHAR
         : ( '\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         |'\u0027' {false}? // '
         |'\u0028' {false}? // (
         |'\u0029' {false}? // )
         |'\u002A' {false}? // *
         |'\u002B' {false}? // +
         |'\u002C' {false}? // ,
         |'\u002D' {false}? // -
         |'\u002E' {false}? // .
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
         // |'\u003D' // =
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
         // |'\u007C' {false}? // |
         |'\u007D' // }
         |'\u007E' // ~
         |'\u007F'..'\uFFFF' // DEL .. inf
         );

EVAL_LANGUAGE_MODE_STRING_MATCH
        // one or more characters, CHAR_MATCH catches shorter ones
        : (EVAL_LANGUAGE_MODE_CHAR)+;

EVAL_LANGUAGE_MODE_SINGLE_QUOTED_STRING_MATCH
        : '\'' ( '\\'. | ~('\''| '\\') )* '\''
        ;

EVAL_LANGUAGE_MODE_QUOTED_STRING_MATCH
//        : EVAL_LANGUAGE_MODE_DQSTRING (EVAL_LANGUAGE_MODE_CHAR)+ EVAL_LANGUAGE_MODE_DQSTRING
        : '"' ( '\\'. | '""' | ~('"'| '\\') )* '"'
        ;

//EVAL_LANGUAGE_MODE_SINGLE_QUOTE: '\''  ( '\\'. | ~('\''| '\\'))*;
//EVAL_LANGUAGE_MODE_DQSTRING: '"' ( '\\'. | ~('"'| '\\'))* '"';

