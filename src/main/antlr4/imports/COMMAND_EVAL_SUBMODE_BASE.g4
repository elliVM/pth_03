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

lexer grammar COMMAND_EVAL_SUBMODE_BASE;

COMMAND_EVAL_SUBMODE_BASE_ANTLR_BUG: 'command_eval_submode_base_antlr_bug' -> type(STRING_MATCH);

// @@@@@@@@@@@@@@ COMMAND_EVAL_SUBMODE_BASE @@@@@@@@@@@@@@
mode COMMAND_EVAL_SUBMODE_BASE;

// comments
COMMAND_EVAL_SUBMODE_BASE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);

// skip
COMMAND_EVAL_SUBMODE_BASE_SPACE: SPACE -> channel(HIDDEN);

// exits
COMMAND_EVAL_SUBMODE_BASE_PIPE: '|' -> type(PIPE), popMode;
COMMAND_EVAL_SUBMODE_BASE_BRACKET_R: ']' -> type(BRACKET_R), popMode, popMode;

// tokens
COMMAND_EVAL_SUBMODE_BASE_PARENTHESIS_L: '(' -> pushMode(EVAL_LANGUAGE_MODE), type(EVAL_LANGUAGE_MODE_PARENTHESIS_L);
COMMAND_EVAL_SUBMODE: SPACE -> channel(HIDDEN);
COMMAND_EVAL_SUBMODE_BASE_PARENTHESIS_R: ')' -> popMode, type(EVAL_LANGUAGE_MODE_PARENTHESIS_R);
COMMAND_EVAL_SUBMODE_BASE_COMMA: ',' -> pushMode(COMMAND_EVAL_SUBMODE_FIELD);
COMMAND_EVAL_SUBMODE_BASE_DEQ: DEQ -> type(EVAL_LANGUAGE_MODE_DEQ);
COMMAND_EVAL_SUBMODE_BASE_EQ: EQ -> type(EVAL_LANGUAGE_MODE_EQ);
COMMAND_EVAL_SUBMODE_BASE_EQUALITY: EQ EQ -> type(EVAL_LANGUAGE_MODE_EQUALITY);
COMMAND_EVAL_SUBMODE_BASE_NEQ: '!=' -> type(EVAL_LANGUAGE_MODE_NEQ);
COMMAND_EVAL_SUBMODE_BASE_LT: LT -> type(EVAL_LANGUAGE_MODE_LT);
COMMAND_EVAL_SUBMODE_BASE_LTE: LTE -> type(EVAL_LANGUAGE_MODE_LTE);
COMMAND_EVAL_SUBMODE_BASE_GT: GT -> type(EVAL_LANGUAGE_MODE_GT);
COMMAND_EVAL_SUBMODE_BASE_GTE: GTE -> type(EVAL_LANGUAGE_MODE_GTE);

fragment COMMAND_EVAL_SUBMODE_BASE_DIGIT: [0-9];
COMMAND_EVAL_SUBMODE_BASE_INTEGER: (COMMAND_EVAL_SUBMODE_BASE_MINUS)? COMMAND_EVAL_SUBMODE_BASE_DIGIT+ -> type(EVAL_LANGUAGE_MODE_INTEGER);
COMMAND_EVAL_SUBMODE_BASE_DECIMAL: (COMMAND_EVAL_SUBMODE_BASE_MINUS)? [0-9]+ COMMAND_EVAL_SUBMODE_BASE_DOT [0-9]+ -> type(EVAL_LANGUAGE_MODE_DECIMAL);
COMMAND_EVAL_SUBMODE_BASE_DOT: '.' -> type(EVAL_LANGUAGE_MODE_DOT);
COMMAND_EVAL_SUBMODE_BASE_AND: ('AND' | 'and') -> type(EVAL_LANGUAGE_MODE_AND);
COMMAND_EVAL_SUBMODE_BASE_OR: ('OR' | 'or') -> type(EVAL_LANGUAGE_MODE_OR);
COMMAND_EVAL_SUBMODE_BASE_XOR: ('XOR' | 'xor') -> type(EVAL_LANGUAGE_MODE_XOR);
COMMAND_EVAL_SUBMODE_BASE_WILDCARD: WILDCARD -> type(EVAL_LANGUAGE_MODE_WILDCARD);
COMMAND_EVAL_SUBMODE_BASE_PLUS: PLUS -> type(EVAL_LANGUAGE_MODE_PLUS);
COMMAND_EVAL_SUBMODE_BASE_MINUS: MINUS -> type(EVAL_LANGUAGE_MODE_MINUS);
COMMAND_EVAL_SUBMODE_BASE_SLASH: SLASH -> type(EVAL_LANGUAGE_MODE_SLASH);
COMMAND_EVAL_SUBMODE_BASE_Like: 'LIKE' -> type(EVAL_LANGUAGE_MODE_Like);
COMMAND_EVAL_SUBMODE_BASE_PERCENT: '%' -> type(EVAL_LANGUAGE_MODE_PERCENT);
COMMAND_EVAL_SUBMODE_BASE_EXCLAMATION: '!' -> type(EVAL_LANGUAGE_MODE_EXCLAMATION);
COMMAND_EVAL_SUBMODE_BASE_NOT: 'NOT' -> type(EVAL_LANGUAGE_MODE_NOT);
COMMAND_EVAL_SUBMODE_BASE_KEEPLAST : 'keeplast='  -> pushMode(GET_BOOLEAN);
COMMAND_EVAL_SUBMODE_BASE_LIMIT : 'limit=' -> pushMode(GET_INTEGER);
COMMAND_EVAL_SUBMODE_BASE_NULL_EQ : 'null=' -> pushMode(GET_BOOLEAN);

//eval-functions
COMMAND_EVAL_SUBMODE_BASE_ABS: 'abs' -> type(EVAL_LANGUAGE_MODE_ABS);
COMMAND_EVAL_SUBMODE_BASE_ACOS: 'acos' -> type(EVAL_LANGUAGE_MODE_ACOS);
COMMAND_EVAL_SUBMODE_BASE_ACOSH: 'acosh' -> type(EVAL_LANGUAGE_MODE_ACOSH);
COMMAND_EVAL_SUBMODE_BASE_ASIN: 'asin' -> type(EVAL_LANGUAGE_MODE_ASIN);
COMMAND_EVAL_SUBMODE_BASE_ASINH: 'asinh' -> type(EVAL_LANGUAGE_MODE_ASINH);
COMMAND_EVAL_SUBMODE_BASE_ATAN: 'atan' -> type(EVAL_LANGUAGE_MODE_ATAN);
COMMAND_EVAL_SUBMODE_BASE_ATAN2: 'atan2' -> type(EVAL_LANGUAGE_MODE_ATAN2);
COMMAND_EVAL_SUBMODE_BASE_ATANH: 'atanh' -> type(EVAL_LANGUAGE_MODE_ATANH);
COMMAND_EVAL_SUBMODE_BASE_AVG: 'avg' -> type(EVAL_LANGUAGE_MODE_AVG);
COMMAND_EVAL_SUBMODE_BASE_CASE: 'case' -> type(EVAL_LANGUAGE_MODE_CASE);
COMMAND_EVAL_SUBMODE_BASE_CEILING: ('ceil'|'ceiling') -> type(EVAL_LANGUAGE_MODE_CEILING);
COMMAND_EVAL_SUBMODE_BASE_CIDRMATCH: 'cidrmatch' -> type(EVAL_LANGUAGE_MODE_CIDRMATCH);
COMMAND_EVAL_SUBMODE_BASE_COALESCE: 'coalesce' -> type(EVAL_LANGUAGE_MODE_COALESCE);
COMMAND_EVAL_SUBMODE_BASE_COMMANDS: 'commands' -> type(EVAL_LANGUAGE_MODE_COMMANDS);
COMMAND_EVAL_SUBMODE_BASE_COS: 'cos' -> type(EVAL_LANGUAGE_MODE_COS);
COMMAND_EVAL_SUBMODE_BASE_COSH: 'cosh' -> type(EVAL_LANGUAGE_MODE_COSH);
COMMAND_EVAL_SUBMODE_BASE_EVAL: 'eval' -> type(EVAL_LANGUAGE_MODE_EVAL);
COMMAND_EVAL_SUBMODE_BASE_EXACT: 'exact' -> type(EVAL_LANGUAGE_MODE_EXACT);
COMMAND_EVAL_SUBMODE_BASE_EXP: 'exp' -> type(EVAL_LANGUAGE_MODE_EXP);
COMMAND_EVAL_SUBMODE_BASE_FALSE: 'false' -> type(EVAL_LANGUAGE_MODE_FALSE);
COMMAND_EVAL_SUBMODE_BASE_FLOOR: 'floor' -> type(EVAL_LANGUAGE_MODE_FLOOR);
COMMAND_EVAL_SUBMODE_BASE_HYPOT: 'hypot' -> type(EVAL_LANGUAGE_MODE_HYPOT);
COMMAND_EVAL_SUBMODE_BASE_IF: 'if' -> type(EVAL_LANGUAGE_MODE_IF);
COMMAND_EVAL_SUBMODE_BASE_IFNULL: 'ifnull' -> type(EVAL_LANGUAGE_MODE_IFNULL);
COMMAND_EVAL_SUBMODE_BASE_IN: 'in' -> type(EVAL_LANGUAGE_MODE_IN);
COMMAND_EVAL_SUBMODE_BASE_ISBOOL: 'isbool' -> type(EVAL_LANGUAGE_MODE_ISBOOL);
COMMAND_EVAL_SUBMODE_BASE_ISINT: 'isint' -> type(EVAL_LANGUAGE_MODE_ISINT);
COMMAND_EVAL_SUBMODE_BASE_ISNOTNULL: 'isnotnull' -> type(EVAL_LANGUAGE_MODE_ISNOTNULL);
COMMAND_EVAL_SUBMODE_BASE_ISNULL: 'isnull' -> type(EVAL_LANGUAGE_MODE_ISNULL);
COMMAND_EVAL_SUBMODE_BASE_ISNUM: 'isnum' -> type(EVAL_LANGUAGE_MODE_ISNUM);
COMMAND_EVAL_SUBMODE_BASE_ISSTR: 'isstr' -> type(EVAL_LANGUAGE_MODE_ISSTR);
COMMAND_EVAL_SUBMODE_JSON_VALID: 'json_valid' -> type(EVAL_LANGUAGE_MODE_JSON_VALID);
COMMAND_EVAL_SUBMODE_JSON_OBJECT: 'json_object' -> type(EVAL_LANGUAGE_MODE_JSON_OBJECT);
COMMAND_EVAL_SUBMODE_BASE_LEN: 'len' -> type(EVAL_LANGUAGE_MODE_LEN);
COMMAND_EVAL_SUBMODE_BASE_LIKE: 'like' -> type(EVAL_LANGUAGE_MODE_LIKE);
COMMAND_EVAL_SUBMODE_BASE_LN: 'ln' -> type(EVAL_LANGUAGE_MODE_LN);
COMMAND_EVAL_SUBMODE_BASE_LOG: 'log' -> type(EVAL_LANGUAGE_MODE_LOG);
COMMAND_EVAL_SUBMODE_BASE_LOWER: 'lower' -> type(EVAL_LANGUAGE_MODE_LOWER);
COMMAND_EVAL_SUBMODE_BASE_LTRIM: 'ltrim' -> type(EVAL_LANGUAGE_MODE_LTRIM);
COMMAND_EVAL_SUBMODE_BASE_MATCH: 'match' -> type(EVAL_LANGUAGE_MODE_MATCH);
COMMAND_EVAL_SUBMODE_BASE_MAX: 'max' -> type(EVAL_LANGUAGE_MODE_MAX);
COMMAND_EVAL_SUBMODE_BASE_MD5: 'md5' -> type(EVAL_LANGUAGE_MODE_MD5);
COMMAND_EVAL_SUBMODE_BASE_MIN: 'min' -> type(EVAL_LANGUAGE_MODE_MIN);
COMMAND_EVAL_SUBMODE_BASE_MVAPPEND: 'mvappend' -> type(EVAL_LANGUAGE_MODE_MVAPPEND);
COMMAND_EVAL_SUBMODE_BASE_MVCOUNT: 'mvcount' -> type(EVAL_LANGUAGE_MODE_MVCOUNT);
COMMAND_EVAL_SUBMODE_BASE_MVDEDUP: 'mvdedup' -> type(EVAL_LANGUAGE_MODE_MVDEDUP);
COMMAND_EVAL_SUBMODE_BASE_MVFILTER: 'mvfilter' -> type(EVAL_LANGUAGE_MODE_MVFILTER);
COMMAND_EVAL_SUBMODE_BASE_MVFIND: 'mvfind' -> type(EVAL_LANGUAGE_MODE_MVFIND);
COMMAND_EVAL_SUBMODE_BASE_MVINDEX: 'mvindex' -> type(EVAL_LANGUAGE_MODE_MVINDEX);
COMMAND_EVAL_SUBMODE_BASE_MVJOIN: 'mvjoin' -> type(EVAL_LANGUAGE_MODE_MVJOIN);
COMMAND_EVAL_SUBMODE_BASE_MVRANGE: 'mvrange' -> type(EVAL_LANGUAGE_MODE_MVRANGE);
COMMAND_EVAL_SUBMODE_BASE_MVSORT: 'mvsort' -> type(EVAL_LANGUAGE_MODE_MVSORT);
COMMAND_EVAL_SUBMODE_BASE_MVZIP: 'mvzip' -> type(EVAL_LANGUAGE_MODE_MVZIP);
COMMAND_EVAL_SUBMODE_BASE_NOW: 'now' -> type(EVAL_LANGUAGE_MODE_NOW);
COMMAND_EVAL_SUBMODE_BASE_NULL: 'null' -> type(EVAL_LANGUAGE_MODE_NULL);
COMMAND_EVAL_SUBMODE_BASE_NULLIF: 'nullif' -> type(EVAL_LANGUAGE_MODE_NULLIF);
COMMAND_EVAL_SUBMODE_BASE_PI: 'pi' -> type(EVAL_LANGUAGE_MODE_PI);
COMMAND_EVAL_SUBMODE_BASE_PRINTF: 'printf' -> type(EVAL_LANGUAGE_MODE_PRINTF);
COMMAND_EVAL_SUBMODE_BASE_POW: 'pow' -> type(EVAL_LANGUAGE_MODE_POW);
COMMAND_EVAL_SUBMODE_BASE_RANDOM: 'random' -> type(EVAL_LANGUAGE_MODE_RANDOM);
COMMAND_EVAL_SUBMODE_BASE_RELATIVE_TIME: 'relative_time' -> type(EVAL_LANGUAGE_MODE_RELATIVE_TIME);
COMMAND_EVAL_SUBMODE_BASE_REPLACE: 'replace' -> type(EVAL_LANGUAGE_MODE_REPLACE);
COMMAND_EVAL_SUBMODE_BASE_ROUND: 'round' -> type(EVAL_LANGUAGE_MODE_ROUND);
COMMAND_EVAL_SUBMODE_BASE_RTRIM: 'rtrim' -> type(EVAL_LANGUAGE_MODE_RTRIM);
COMMAND_EVAL_SUBMODE_BASE_SEARCHMATCH: 'searchmatch' -> type(EVAL_LANGUAGE_MODE_SEARCHMATCH);
COMMAND_EVAL_SUBMODE_BASE_SHA1: 'sha1' -> type(EVAL_LANGUAGE_MODE_SHA1);
COMMAND_EVAL_SUBMODE_BASE_SHA256: 'sha256' -> type(EVAL_LANGUAGE_MODE_SHA256);
COMMAND_EVAL_SUBMODE_BASE_SHA512: 'sha512' -> type(EVAL_LANGUAGE_MODE_SHA512);
COMMAND_EVAL_SUBMODE_BASE_SIGFIG: 'sigfig' -> type(EVAL_LANGUAGE_MODE_SIGFIG);
COMMAND_EVAL_SUBMODE_BASE_SIN: 'sin' -> type(EVAL_LANGUAGE_MODE_SIN);
COMMAND_EVAL_SUBMODE_BASE_SINH: 'sinh' -> type(EVAL_LANGUAGE_MODE_SINH);
COMMAND_EVAL_SUBMODE_BASE_SPATH: 'spath' -> type(EVAL_LANGUAGE_MODE_SPATH);
COMMAND_EVAL_SUBMODE_BASE_SPLIT: 'split' -> type(EVAL_LANGUAGE_MODE_SPLIT);
COMMAND_EVAL_SUBMODE_BASE_SQRT: 'sqrt' -> type(EVAL_LANGUAGE_MODE_SQRT);
COMMAND_EVAL_SUBMODE_BASE_SUM: 'sum' -> type(EVAL_LANGUAGE_MODE_SUM);
COMMAND_EVAL_SUBMODE_BASE_STRFTIME: 'strftime' -> type(EVAL_LANGUAGE_MODE_STRFTIME);
COMMAND_EVAL_SUBMODE_BASE_STRPTIME: 'strptime' -> type(EVAL_LANGUAGE_MODE_STRPTIME);
COMMAND_EVAL_SUBMODE_BASE_SUBSTR: 'substr' -> type(EVAL_LANGUAGE_MODE_SUBSTR);
COMMAND_EVAL_SUBMODE_BASE_TAN: 'tan' -> type(EVAL_LANGUAGE_MODE_TAN);
COMMAND_EVAL_SUBMODE_BASE_TANH: 'tanh' -> type(EVAL_LANGUAGE_MODE_TANH);
COMMAND_EVAL_SUBMODE_BASE_TIME: 'time' -> type(EVAL_LANGUAGE_MODE_TIME);
COMMAND_EVAL_SUBMODE_BASE_TONUMBER: 'tonumber' -> type(EVAL_LANGUAGE_MODE_TONUMBER);
COMMAND_EVAL_SUBMODE_BASE_TOSTRING: 'tostring' -> type(EVAL_LANGUAGE_MODE_TOSTRING);
COMMAND_EVAL_SUBMODE_BASE_TRIM: 'trim' -> type(EVAL_LANGUAGE_MODE_TRIM);
COMMAND_EVAL_SUBMODE_BASE_TRUE: 'true' -> type(EVAL_LANGUAGE_MODE_TRUE);
COMMAND_EVAL_SUBMODE_BASE_TYPEOF: 'typeof' -> type(EVAL_LANGUAGE_MODE_TYPEOF);
COMMAND_EVAL_SUBMODE_BASE_UPPER: 'upper' -> type(EVAL_LANGUAGE_MODE_UPPER);
COMMAND_EVAL_SUBMODE_BASE_URLDECODE: 'urldecode' -> type(EVAL_LANGUAGE_MODE_URLDECODE);
COMMAND_EVAL_SUBMODE_BASE_VALIDATE: 'validate' -> type(EVAL_LANGUAGE_MODE_VALIDATE);


// characters for string
fragment COMMAND_EVAL_SUBMODE_BASE_CHAR
         : (
         '\u0023' // #
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
         |'\u003C' {false}? // <
         |'\u003D' {false}? // =
         |'\u003E' {false}? // >
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
         |'\u007C' {false}? // |
         |'\u007D' // }
         |'\u007E' // ~
         |'\u007F'..'\uFFFF' // DEL .. inf
         );

COMMAND_EVAL_SUBMODE_BASE_STRING_MATCH
        // one or more characters, CHAR_MATCH catches shorter ones
        : (COMMAND_EVAL_SUBMODE_BASE_CHAR)+ -> type(EVAL_LANGUAGE_MODE_STRING_MATCH);

COMMAND_EVAL_SUBMODE_BASE_SINGLE_QUOTED_STRING_MATCH
        // : EVAL_LANGUAGE_MODE_SINGLE_QUOTE (COMMAND_EVAL_SUBMODE_BASE_CHAR)+ EVAL_LANGUAGE_MODE_SINGLE_QUOTE -> type(EVAL_LANGUAGE_MODE_STRING_MATCH)
        : '\'' ( '\\'. | ~('\''| '\\' | '=' ) )* '\'' -> type(EVAL_LANGUAGE_MODE_SINGLE_QUOTED_STRING_MATCH)
        ;

COMMAND_EVAL_SUBMODE_BASE_QUOTED_STRING_MATCH
        // : EVAL_LANGUAGE_MODE_DQSTRING (COMMAND_EVAL_SUBMODE_BASE_CHAR)+ EVAL_LANGUAGE_MODE_DQSTRING -> type(EVAL_LANGUAGE_MODE_STRING_MATCH)
        : '"' ( '\\'. | '""' | ~('"'| '\\' | '=' ) )* '"' -> type(EVAL_LANGUAGE_MODE_QUOTED_STRING_MATCH)
        ;

//COMMAND_EVAL_SUBMODE_BASE_SINGLE_QUOTE: '\'' ( '\\'. | ~( '\\') )*
//COMMAND_EVAL_SUBMODE_BASE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(EVAL_LANGUAGE_MODE_DQSTRING);

// @@@@@@@@@@@@@@ COMMAND_EVAL_SUBMODE_FIELD @@@@@@@@@@@@@@
mode COMMAND_EVAL_SUBMODE_FIELD;

// http://antlr.1301665.n2.nabble.com/Reuse-of-same-token-in-multiple-lexer-modes-td7578956.html

// comments
COMMAND_EVAL_SUBMODE_FIELD_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);

// skip
COMMAND_EVAL_SUBMODE_FIELD_SPACE: SPACE -> channel(HIDDEN);

// exits
COMMAND_EVAL_SUBMODE_FIELD_PIPE: '|' -> type(PIPE), popMode; //mode(COMMAND_MODE);
COMMAND_EVAL_SUBMODE_FIELD_BRACKET_R: ']' -> type(BRACKET_R), popMode;  //mode(COMMAND_MODE);

// tokens
COMMAND_EVAL_SUBMODE_FIELD_EQ: '=' -> popMode; // Change mode back after '=' 

// characters for string
fragment COMMAND_EVAL_SUBMODE_FIELD_CHAR
         : (
         '\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         |'\u0027' // '
         |'\u0028' // (
         |'\u0029' // )
         |'\u002A' // *
         |'\u002B' // +
         |'\u002C' // ,
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

COMMAND_EVAL_SUBMODE_FIELD_STRING_MATCH
        // one or more characters, CHAR_MATCH catches shorter ones
        : (COMMAND_EVAL_SUBMODE_FIELD_CHAR)+ -> type(GET_FIELD_STRING);


COMMAND_EVAL_SUBMODE_FIELD_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_FIELD_SINGLE_QUOTED);
COMMAND_EVAL_SUBMODE_FIELD_SINGLE_QUOTE: '\'' ( '\\'. | ~('\''| '\\') )* '\'' -> type(GET_FIELD_DOUBLE_QUOTED);
