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

lexer grammar COMMAND_AGGREGATION_MODE;

COMMAND_AGGREGATION_MODE_ANTLR_BUG: 'command_aggregation_mode_antlr_bug' -> type(STRING_MATCH);

// ++++++++++++++ AGGREGATION_MODE ++++++++++++++
mode AGGREGATION_MODE;

// http://antlr.1301665.n2.nabble.com/Reuse-of-same-token-in-multiple-lexer-modes-td7578956.html

// skip
METHOD_AGGREGATE_SPACE: SPACE -> channel(HIDDEN);

// exits
METHOD_AGGREGATE_PARENTHESIS_R: ')' -> popMode;

METHOD_AGGREGATE_EVAL_L: 'eval(' -> pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_AVG: 'avg(';
METHOD_AGGREGATE_MEAN: 'mean(';
METHOD_AGGREGATE_C: 'c(';
METHOD_AGGREGATE_COUNT_B: 'count(';
METHOD_AGGREGATE_COUNT: 'count' -> popMode;
METHOD_AGGREGATE_COUNT_C: 'c' -> popMode;
METHOD_AGGREGATE_DC: 'dc(';
METHOD_AGGREGATE_DISTINCT_COUNT: 'distinct_count(';
METHOD_AGGREGATE_EARLIEST: 'earliest(';
METHOD_AGGREGATE_EARLIEST_TIME: 'earliest_time(';
METHOD_AGGREGATE_ESTDC: 'estdc(';
METHOD_AGGREGATE_ESTDC_ERROR: 'estdc_error(';
METHOD_AGGREGATE_FIRST: 'first(';
METHOD_AGGREGATE_LAST: 'last(';
METHOD_AGGREGATE_LATEST: 'latest(';
METHOD_AGGREGATE_LATEST_TIME: 'latest_time(';
METHOD_AGGREGATE_LIST: 'list(';
METHOD_AGGREGATE_MAX: 'max(';
METHOD_AGGREGATE_MEDIAN: 'median(';
METHOD_AGGREGATE_MIN: 'min(';
METHOD_AGGREGATE_MODE: 'mode(';

//perc
METHOD_AGGREGATE_P: 'p(';
METHOD_AGGREGATE_PERC: 'perc(';
METHOD_AGGREGATE_EXACTPERC: 'exactperc(';
METHOD_AGGREGATE_UPPERPERC: 'upperperc(';
//special percX()
METHOD_AGGREGATE_P_VARIABLE: 'p'METHOD_AGGREGATE_INTEGER;
METHOD_AGGREGATE_PERC_VARIABLE: 'perc'METHOD_AGGREGATE_INTEGER;
METHOD_AGGREGATE_EXACTPERC_VARIABLE: 'exactperc'METHOD_AGGREGATE_INTEGER;
METHOD_AGGREGATE_UPPERPERC_VARIABLE: 'upperperc'METHOD_AGGREGATE_INTEGER;

METHOD_AGGREGATE_PERCINT: 'percint(';
METHOD_AGGREGATE_RANGE: 'range(';
METHOD_AGGREGATE_RATE: 'rate(';
METHOD_AGGREGATE_STDEV: 'stdev(';
METHOD_AGGREGATE_STDEVP: 'stdevp(';
METHOD_AGGREGATE_SUM: 'sum(';
METHOD_AGGREGATE_SUMSQ: 'sumsq(';
METHOD_AGGREGATE_VALUES: 'values(';
METHOD_AGGREGATE_VAR: 'var(';
METHOD_AGGREGATE_VARP: 'varp(';

METHOD_AGGREGATE_PER_SECOND: 'per_second(';
METHOD_AGGREGATE_PER_HOUR: 'per_hour(';
METHOD_AGGREGATE_PER_DAY: 'per_day(';
METHOD_AGGREGATE_PER_MINUTE: 'per_minute(';

//eval-functions
METHOD_AGGREGATE_ABS: 'abs'-> type(EVAL_LANGUAGE_MODE_ABS), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ACOS: 'acos' -> type(EVAL_LANGUAGE_MODE_ACOS), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ACOSH: 'acosh' -> type(EVAL_LANGUAGE_MODE_ACOSH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ASIN: 'asin' -> type(EVAL_LANGUAGE_MODE_ASIN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ASINH: 'asinh' -> type(EVAL_LANGUAGE_MODE_ASINH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ATAN: 'atan' -> type(EVAL_LANGUAGE_MODE_ATAN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ATAN2: 'atan2' -> type(EVAL_LANGUAGE_MODE_ATAN2),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ATANH: 'atanh' -> type(EVAL_LANGUAGE_MODE_ATANH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_CASE: 'case' -> type(EVAL_LANGUAGE_MODE_CASE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_CEILING: 'ceiling' -> type(EVAL_LANGUAGE_MODE_CEILING),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_CIDRMATCH: 'cidrmatch' -> type(EVAL_LANGUAGE_MODE_CIDRMATCH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_COALESCE: 'coalesce' -> type(EVAL_LANGUAGE_MODE_COALESCE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_COMMANDS: 'commands' -> type(EVAL_LANGUAGE_MODE_COMMANDS),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_COS: 'cos' -> type(EVAL_LANGUAGE_MODE_COS),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_COSH: 'cosh' -> type(EVAL_LANGUAGE_MODE_COSH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_EXACT: 'exact' -> type(EVAL_LANGUAGE_MODE_EXACT),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_EXP: 'exp' -> type(EVAL_LANGUAGE_MODE_EXP),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_FALSE: 'false' -> type(EVAL_LANGUAGE_MODE_FALSE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_FLOOR: 'floor' -> type(EVAL_LANGUAGE_MODE_FLOOR), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_HYPOT: 'hypot' -> type(EVAL_LANGUAGE_MODE_HYPOT),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_IF: 'if' -> type(EVAL_LANGUAGE_MODE_IF),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_IFNULL: 'ifnull' -> type(EVAL_LANGUAGE_MODE_IFNULL),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_IN: 'in' -> type(EVAL_LANGUAGE_MODE_IN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ISBOOL: 'isbool' -> type(EVAL_LANGUAGE_MODE_ISBOOL),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ISINT: 'isint' -> type(EVAL_LANGUAGE_MODE_ISINT),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ISNOTNULL: 'isnotnull' -> type(EVAL_LANGUAGE_MODE_ISNOTNULL),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ISNULL: 'isnull' -> type(EVAL_LANGUAGE_MODE_ISNULL),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ISNUM: 'isnum' -> type(EVAL_LANGUAGE_MODE_ISNUM),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ISSTR: 'isstr' -> type(EVAL_LANGUAGE_MODE_ISSTR),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_JSON_VALID: 'json_valid' -> type(EVAL_LANGUAGE_MODE_JSON_VALID),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_LEN: 'len' -> type(EVAL_LANGUAGE_MODE_LEN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_LIKE: 'like' -> type(EVAL_LANGUAGE_MODE_LIKE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_LN: 'ln' -> type(EVAL_LANGUAGE_MODE_LN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_LOG: 'log' -> type(EVAL_LANGUAGE_MODE_LOG),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_LOWER: 'lower' -> type(EVAL_LANGUAGE_MODE_LOWER),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_LTRIM: 'ltrim' -> type(EVAL_LANGUAGE_MODE_LTRIM),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MATCH: 'match' -> type(EVAL_LANGUAGE_MODE_MATCH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MAX: 'max' -> type(EVAL_LANGUAGE_MODE_MAX),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MD5: 'md5' -> type(EVAL_LANGUAGE_MODE_MD5),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MIN: 'min' -> type(EVAL_LANGUAGE_MODE_MIN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVAPPEND: 'mvappend' -> type(EVAL_LANGUAGE_MODE_MVAPPEND),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVCOUNT: 'mvcount' -> type(EVAL_LANGUAGE_MODE_MVCOUNT),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVDEDUP: 'mvdedup' -> type(EVAL_LANGUAGE_MODE_MVDEDUP),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVFILTER: 'mvfilter' -> type(EVAL_LANGUAGE_MODE_MVFILTER),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVFIND: 'mvfind' -> type(EVAL_LANGUAGE_MODE_MVFIND),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVINDEX: 'mvindex' -> type(EVAL_LANGUAGE_MODE_MVINDEX),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVJOIN: 'mvjoin' -> type(EVAL_LANGUAGE_MODE_MVJOIN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVRANGE: 'mvrange' -> type(EVAL_LANGUAGE_MODE_MVRANGE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVSORT: 'mvsort' -> type(EVAL_LANGUAGE_MODE_MVSORT),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_MVZIP: 'mvzip' -> type(EVAL_LANGUAGE_MODE_MVZIP),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_NOW: 'now' -> type(EVAL_LANGUAGE_MODE_NOW),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_NULL: 'null' -> type(EVAL_LANGUAGE_MODE_NULL), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_NULLIF: 'nullif' -> type(EVAL_LANGUAGE_MODE_NULLIF),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_PI: 'pi' -> type(EVAL_LANGUAGE_MODE_PI), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_PRINTF: 'printf' -> type(EVAL_LANGUAGE_MODE_PRINTF),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_POW: 'pow' -> type(EVAL_LANGUAGE_MODE_POW), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_RANDOM: 'random' -> type(EVAL_LANGUAGE_MODE_RANDOM), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_RELATIVE_TIME: 'relative_time' -> type(EVAL_LANGUAGE_MODE_RELATIVE_TIME),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_REPLACE: 'replace' -> type(EVAL_LANGUAGE_MODE_REPLACE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_ROUND: 'round' -> type(EVAL_LANGUAGE_MODE_ROUND),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_RTRIM: 'rtrim' -> type(EVAL_LANGUAGE_MODE_RTRIM), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SEARCHMATCH: 'searchmatch' -> type(EVAL_LANGUAGE_MODE_SEARCHMATCH), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SHA1: 'sha1' -> type(EVAL_LANGUAGE_MODE_SHA1), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SHA256: 'sha256' -> type(EVAL_LANGUAGE_MODE_SHA256), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SHA512: 'sha512' -> type(EVAL_LANGUAGE_MODE_SHA512), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SIGFIG: 'sigfig' -> type(EVAL_LANGUAGE_MODE_SIGFIG),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SIN: 'sin' -> type(EVAL_LANGUAGE_MODE_SIN),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SINH: 'sinh' -> type(EVAL_LANGUAGE_MODE_SINH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SPATH: 'spath' -> type(EVAL_LANGUAGE_MODE_SPATH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SPLIT: 'split' -> type(EVAL_LANGUAGE_MODE_SPLIT), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SQRT: 'sqrt' -> type(EVAL_LANGUAGE_MODE_SQRT),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_STRFTIME: 'strftime' -> type(EVAL_LANGUAGE_MODE_STRFTIME), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_STRPTIME: 'strptime' -> type(EVAL_LANGUAGE_MODE_STRPTIME), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_SUBSTR: 'substr' -> type(EVAL_LANGUAGE_MODE_SUBSTR),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TAN: 'tan' -> type(EVAL_LANGUAGE_MODE_TAN), pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TANH: 'tanh' -> type(EVAL_LANGUAGE_MODE_TANH),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TIME: 'time' -> type(EVAL_LANGUAGE_MODE_TIME),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TONUMBER: 'tonumber' -> type(EVAL_LANGUAGE_MODE_TONUMBER),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TOSTRING: 'tostring' -> type(EVAL_LANGUAGE_MODE_TOSTRING),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TRIM: 'trim' -> type(EVAL_LANGUAGE_MODE_TRIM),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TRUE: 'true' -> type(EVAL_LANGUAGE_MODE_TRUE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_TYPEOF: 'typeof' -> type(EVAL_LANGUAGE_MODE_TYPEOF),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_UPPER: 'upper' -> type(EVAL_LANGUAGE_MODE_UPPER),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_URLDECODE: 'urldecode' -> type(EVAL_LANGUAGE_MODE_URLDECODE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_VALIDATE: 'validate' -> type(EVAL_LANGUAGE_MODE_VALIDATE),pushMode(EVAL_LANGUAGE_MODE);
METHOD_AGGREGATE_JSON_OBJECT: 'json_object' -> type(EVAL_LANGUAGE_MODE_JSON_OBJECT),pushMode(EVAL_LANGUAGE_MODE);

METHOD_AGGREGATE_DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"';
METHOD_AGGREGATE_STRING_MATCH: (METHOD_AGGREGATE_CHAR)+;

METHOD_AGGREGATE_INTEGER: DIGIT  -> popMode;
fragment DIGIT: [0-9]+;
METHOD_AGGREGATE_PARENTHESIS_L: '(';


fragment METHOD_AGGREGATE_CHAR
         :'\u0023' // #
         |'\u0024' // $
         |'\u0025' // %
         |'\u0026' // &
         |'\u0027' // '
         // |'\u0028' // (
         // |'\u0029' // )
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
COMMAND_AGGREGATION_MODE_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);
