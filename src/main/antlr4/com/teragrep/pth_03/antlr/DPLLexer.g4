/*
 * Teragrep Data Processing Language Parser Library PTH-03
 * Copyright (C) 2019, 2020, 2021, 2022  Suomen Kanuuna Oy
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
lexer grammar DPLLexer;

import GET_BOOLEAN, GET_INTEGER, GET_FIELD, GET_NUMBER, GET_INDEX_STRING, GET_REGEX_STRING, GET_SORT_FIELD, GET_TIME, GET_SPAN, GET_STRING, GET_WHERE_MODE, GET_WHERE_MODE_BY ,GET_T_OR_B, COMMAND_ABSTRACT_MODE, COMMAND_ACCUM_MODE, COMMAND_ADDCOLTOTALS_MODE, COMMAND_ADDINFO_MODE, COMMAND_ADDTOTALS_MODE, COMMAND_AGGREGATION_MODE, COMMAND_ANALYZEFIELDS_MODE, COMMAND_ANOMALIES_MODE, COMMAND_ANOMALOUSVALUE_MODE, COMMAND_ANOMALYDETECTION_MODE, COMMAND_APPENDCOLS_MODE, COMMAND_APPEND_MODE, COMMAND_APPENDPIPE_MODE, COMMAND_ARULES_MODE, COMMAND_ASSOCIATE_MODE, COMMAND_AUDIT_MODE, COMMAND_AUTOREGRESS_MODE, COMMAND_BIN_MODE, COMMAND_BUCKETDIR_MODE, COMMAND_CHART_MODE, COMMAND_CLUSTER_MODE, COMMAND_COFILTER_MODE, COMMAND_COLLAPSE_MODE, COMMAND_COLLECT_MODE, COMMAND_CONCURRENCY_MODE, COMMAND_CONTINGENCY_MODE, COMMAND_CONVERT_MODE, COMMAND_CORRELATE_MODE, COMMAND_DATAMODEL_MODE, COMMAND_DBINSPECT_MODE, COMMAND_DEDUP_MODE, COMMAND_DELETE_MODE, COMMAND_DELTA_MODE, COMMAND_DIFF_MODE, COMMAND_DPL_MODE, COMMAND_DUMP_MODE, COMMAND_EREX_MODE, COMMAND_EVAL_SUBMODE_BASE, EVAL_LANGUAGE_MODE, COMMAND_EVENTCOUNT_MODE, COMMAND_EVENTSTATS_MODE, COMMAND_EXPLAIN_MODE, COMMAND_EXTRACT_MODE, COMMAND_FIELDS_MODE, COMMAND_FIELDFORMAT_MODE, COMMAND_FIELDSUMMARY_MODE, COMMAND_FILLDOWN_MODE, COMMAND_FILLNULL_MODE, COMMAND_FINDKEYWORDS_MODE, COMMAND_FINDTYPES_MODE, COMMAND_FOLDERIZE_MODE, COMMAND_FOREACH_MODE, COMMAND_FORMAT_MODE, COMMAND_FROM_MODE, COMMAND_GAUGE_MODE, COMMAND_GENTIMES_MODE, COMMAND_GEOMFILTER_MODE, COMMAND_GEOM_MODE, COMMAND_GEOSTATS_MODE, COMMAND_HEAD_MODE, COMMAND_HIGHLIGHT_MODE, COMMAND_HISTORY_MODE, COMMAND_ICONIFY_MODE, COMMAND_INPUTCSV_MODE, COMMAND_INPUTLOOKUP_MODE, COMMAND_IPLOCATION_MODE, COMMAND_JOIN_MODE, COMMAND_KMEANS_MODE, COMMAND_KVFORM_MODE, COMMAND_LOADJOB_MODE, COMMAND_LOCALIZE_MODE, COMMAND_LOCALOP_MODE, COMMAND_LOOKUP_MODE, COMMAND_MAKECONTINUOUS_MODE, COMMAND_MAKEJSON_MODE, COMMAND_MAKEMV_MODE, COMMAND_MAKERESULTS_MODE, COMMAND_MAP_MODE, COMMAND_MCATALOG_MODE, COMMAND_MCOLLECT_MODE, COMMAND_METADATA_MODE, COMMAND_METASEARCH_MODE, COMMAND_MEVENTCOLLECT_MODE, COMMAND_MSTATS_MODE, COMMAND_MULTIKV_MODE, COMMAND_MULTISEARCH_MODE, COMMAND_MVCOMBINE_MODE, COMMAND_MVEXPAND_MODE, COMMAND_NOMV_MODE, COMMAND_OUTLIER_MODE, COMMAND_OUTPUTCSV_MODE, COMMAND_OUTPUTLOOKUP_MODE, COMMAND_OUTPUTTEXT_MODE, COMMAND_OVERLAP_MODE, COMMAND_PIVOT_MODE, COMMAND_PREDICT_MODE, COMMAND_RANGEMAP_MODE, COMMAND_RARE_MODE, COMMAND_REDISTRIBUTE_MODE, COMMAND_REGEX_MODE, COMMAND_RELEVANCY_MODE, COMMAND_RELTIME_MODE, COMMAND_RENAME_MODE, COMMAND_REPLACE_MODE, COMMAND_REST_MODE, COMMAND_RETURN_MODE, COMMAND_REVERSE_MODE, COMMAND_REX_MODE, COMMAND_REX4J_MODE, COMMAND_RTORDER_MODE, COMMAND_RUNSHELLSCRIPT_MODE, COMMAND_SAVEDSEARCH_MODE, COMMAND_SCRIPT_MODE, COMMAND_SCRUB_MODE, COMMAND_SEARCH_MODE, COMMAND_SEARCHTXN_MODE, COMMAND_SELFJOIN_MODE, COMMAND_SENDALERT_MODE, COMMAND_SENDEMAIL_MODE, COMMAND_SETFIELDS_MODE, COMMAND_SET_MODE, COMMAND_SICHART_MODE, COMMAND_SIRARE_MODE, COMMAND_SISTATS_MODE, COMMAND_SITIMECHART_MODE, COMMAND_SITOP_MODE, COMMAND_SORT_MODE, COMMAND_SPATH_MODE, COMMAND_STATS_MODE, COMMAND_STRCAT_MODE, COMMAND_STREAMSTATS_MODE, COMMAND_TABLE_MODE, COMMAND_TAGS_MODE, COMMAND_TAIL_MODE, COMMAND_TERAGREP_MODE, COMMAND_TIMECHART_MODE, COMMAND_TIMEWRAP_MODE, COMMAND_TOP_MODE, COMMAND_TRANSACTION_MODE, COMMAND_TRANSPOSE_MODE, COMMAND_TRENDLINE_MODE, COMMAND_TSCOLLECT_MODE, COMMAND_TSTATS_MODE, COMMAND_TYPEAHEAD_MODE, COMMAND_TYPELEARNER_MODE, COMMAND_TYPER_MODE, COMMAND_UNION_MODE, COMMAND_UNIQ_MODE, COMMAND_UNTABLE_MODE, COMMAND_WHERE_MODE, COMMAND_X11_MODE, COMMAND_XMLKV_MODE, COMMAND_XMLUNESCAPE_MODE, COMMAND_XPATH_MODE, COMMAND_XYSERIES_MODE;

channels { DPLCOMMENT, ERRORCHANNEL }

// ++++++++++++++ DEFAULT_MODE ++++++++++++++
// antlr4 bug, can't say it but it's active already so np
//mode DEFAULT_MODE;
STRING_MATCH: 'default_mode_antlr_bug';


// comments
SPEC_DPL_COMMENT: '<!--' .*? '-->' -> channel(DPLCOMMENT);

// skip
SPACE: [ \t\r\n]+ -> channel(HIDDEN);

// valid for fields
// Reserved words
//indexStatement
INDEX_EQ: 'index=' -> pushMode(GET_STRING);
INDEX_SPACE: 'index' (SPACE)* '=' (SPACE)* -> pushMode(GET_STRING);
INDEX_NEG: 'index!=' -> pushMode(GET_STRING);
INDEX_SPACE_NEG: 'index' (SPACE)* '!=' (SPACE)* -> pushMode(GET_STRING);
INDEX_IN: 'index' (SPACE)* 'IN' (SPACE)* -> pushMode(GET_INDEX_STRING);

//thyme
TIMEFORMAT: 'timeformat' (SPACE)* '='  (SPACE)* -> pushMode(GET_STRING);
EARLIEST: 'earliest' (SPACE)* '='  (SPACE)* -> pushMode(GET_TIME);
INDEX_EARLIEST: '_index_earliest' (SPACE)* '='  (SPACE)* -> pushMode(GET_STRING);
STARTDAYSAGO: 'stardaysago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
STARTHOURSAGO: 'starthoursago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
STARTMINUTESAGO: 'startminutesago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
STARTMONTHSAGO: 'startmonthsago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
STARTTIME: 'starttime' (SPACE)* '='  (SPACE)* -> pushMode(GET_STRING);
STARTTIMEU: 'starttimeu' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
LATEST: 'latest' (SPACE)* '='  (SPACE)* -> pushMode(GET_TIME);
INDEX_LATEST: '_index_latest' (SPACE)* '='  (SPACE)* -> pushMode(GET_STRING);
ENDDAYSAGO: 'enddaysago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
ENDHOURSAGO: 'endhoursago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
ENDMINUTESAGO: 'endminutesago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
ENDMONTHSAGO: 'endmonthsago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
ENDTIME: 'endtime' (SPACE)* '='  (SPACE)* -> pushMode(GET_STRING);
ENDTIMEU: 'endtimeu' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
SEARCHTIMESPANDAYS: 'searchtimespandays' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
SEARCHTIMESPANHOURS: 'searchtimespanhours' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
SEARCHTIMESPANMINUTES: 'searchtimespanminutes' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
SEARCHTIMESPANMONHTS: 'searchtimespanmonths' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
MINUTESAGO: 'minutesago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
HOURSAGO: 'hoursago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
DAYSAGO: 'daysago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);
MONTHSAGO: 'monthsago' (SPACE)* '='  (SPACE)* -> pushMode(GET_INTEGER);

//rest
EVENTTYPE: 'eventtype';
EVENTTYPETAG: 'eventtypetag';
HOST: 'host';
HOSTTAG: 'hosttag';
SAVEDSEARCH: 'savedsearch';
SOURCE: 'source';
SOURCETYPE: 'sourcetype';
TAG: 'tag';
AND: 'AND';
NOT: 'NOT';
OR: 'OR';
TERM: 'TERM';
CASE: 'CASE';
IN: 'IN';

// charType, common types
PARENTHESIS_L: '(';
PARENTHESIS_R: ')';
BRACKET_L: '[' -> pushMode(COMMAND_MODE);
BRACKET_R: ']' -> popMode, popMode;
C_BRACKET_L: '{';
C_BRACKET_R: '}';
PIPE: '|' -> pushMode(COMMAND_MODE);
COMMA: ',';
COLON: ':';
DOT: '.';
EXCLAMATION: '!';
QUOTE: '" ';
SINGLE_QUOTE: '\'';
DOLLAR: '$';
AT_SIGN: '@';

// charType, operations between fields and integers
MINUS: '-';
PLUS: '+';
PERCENT: '%';
WILDCARD: '*';
SLASH: '/';



// equality
DEQ: '==';
EQ: '=';
NEQ: '!=';
LT: '<';
LTE: '<=';
GT: '>';
GTE: '>=';

// quotation types
DQSTRING: '"' ( '\\'. | '""' | ~('"'| '\\') )* '"' -> type(GET_STRING_DOUBLE_QUOTED);
SQSTRING: '\'' ( '\\'. | '""' | ~('"'| '\\') )* '\'' -> type(GET_STRING_SINGLE_QUOTED);

// integers

fragment CHAR
         :'\u0022' // "
         |'\u0023' // #
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
         
STRING
        // two or more characters, CHAR_MATCH catches shorter ones
        // following still is legal | eval a(="a+a"        
        // use lexical modes?
        : (CHAR)+ -> type(GET_STRING_STRING);
//special case
NULL: 'null';

// hide errors
//ERROR_RECONGNIGION: . -> channel(ERRORCHANNEL);

// ++++++++++++++ COMMAND_MODE ++++++++++++++
mode COMMAND_MODE;

// skip
COMMAND_MODE_SPACE: SPACE -> channel(HIDDEN);
COMMAND_MODE_PIPE: '|' -> type(PIPE);

COMMAND_MODE_ABSTRACT: 'abstract' -> pushMode(COMMAND_ABSTRACT_MODE);
COMMAND_MODE_ACCUM: 'accum' -> pushMode(COMMAND_ACCUM_MODE), pushMode(GET_FIELD);
COMMAND_MODE_ADDCOLTOTALS: 'addcoltotals' -> pushMode(COMMAND_ADDCOLTOTALS_MODE);
COMMAND_MODE_ADDINFO: 'addinfo' -> pushMode(COMMAND_ADDINFO_MODE);
COMMAND_MODE_ADDTOTALS: 'addtotals' -> pushMode(COMMAND_ADDTOTALS_MODE);
COMMAND_MODE_ANALYZEFIELDS: 'analyzefields' -> pushMode(COMMAND_ANALYZEFIELDS_MODE);
COMMAND_MODE_ANOMALIES: 'anomalies' -> pushMode(COMMAND_ANOMALIES_MODE);
COMMAND_MODE_ANOMALOUSVALUE: 'anomalousvalue' -> pushMode(COMMAND_ANOMALOUSVALUE_MODE);
COMMAND_MODE_ANOMALYDETECTION: 'anomalydetection' -> pushMode(COMMAND_ANOMALYDETECTION_MODE);
COMMAND_MODE_APPEND: 'append' -> pushMode(COMMAND_APPEND_MODE);
COMMAND_MODE_APPENDCOLS: 'appendcols' -> pushMode(COMMAND_APPENDCOLS_MODE);
COMMAND_MODE_APPENDPIPE: 'appendpipe' -> pushMode(COMMAND_APPENDPIPE_MODE);
COMMAND_MODE_ARULES: 'arules' -> pushMode(COMMAND_ARULES_MODE);
COMMAND_MODE_ASSOCIATE: 'associate' -> pushMode(COMMAND_ASSOCIATE_MODE);
COMMAND_MODE_AUDIT: 'audit' -> pushMode(COMMAND_AUDIT_MODE);
COMMAND_MODE_AUTOREGRESS: 'autoregress' -> pushMode(COMMAND_AUTOREGRESS_MODE);
COMMAND_MODE_BIN: ('bin'|'bucket') -> pushMode(COMMAND_BIN_MODE);
COMMAND_MODE_BUCKETDIR: 'bucketdir' -> pushMode(COMMAND_BUCKETDIR_MODE);
COMMAND_MODE_CHART: 'chart' -> pushMode(COMMAND_CHART_MODE); // implemented
COMMAND_MODE_CLUSTER: 'cluster' -> pushMode(COMMAND_CLUSTER_MODE);
COMMAND_MODE_COFILTER: 'cofilter' -> pushMode(COMMAND_COFILTER_MODE);
COMMAND_MODE_COLLAPSE: 'collapse' -> pushMode(COMMAND_COLLAPSE_MODE);
COMMAND_MODE_COLLECT: 'collect' -> pushMode(COMMAND_COLLECT_MODE);
COMMAND_MODE_CONCURRENCY: 'concurrency' -> pushMode(COMMAND_CONCURRENCY_MODE);
COMMAND_MODE_CONTINGENCY: ('contingency'|'ctable'|'counttable') -> pushMode(COMMAND_CONTINGENCY_MODE);
COMMAND_MODE_CONVERT: 'convert' -> pushMode(COMMAND_CONVERT_MODE);
COMMAND_MODE_CORRELATE: 'correlate' -> pushMode(COMMAND_CORRELATE_MODE);
COMMAND_MODE_DATAMODEL: 'datamodel' -> pushMode(COMMAND_DATAMODEL_MODE);
COMMAND_MODE_DBINSPECT: 'dbinspect' -> pushMode(COMMAND_DBINSPECT_MODE);
COMMAND_MODE_DEDUP: 'dedup' -> pushMode(COMMAND_DEDUP_MODE);
COMMAND_MODE_DELETE: 'delete' -> pushMode(COMMAND_DELETE_MODE);
COMMAND_MODE_DELTA: 'delta' -> pushMode(COMMAND_DELTA_MODE);
COMMAND_MODE_DIFF: 'diff' -> pushMode(COMMAND_DIFF_MODE);
COMMAND_MODE_DPL: 'dpl' -> pushMode(COMMAND_DPL_MODE);
COMMAND_MODE_DUMP: 'dump' -> pushMode(COMMAND_DUMP_MODE);
COMMAND_MODE_EREX: 'erex' -> pushMode(COMMAND_EREX_MODE);
COMMAND_MODE_EVAL: 'eval' -> pushMode(COMMAND_EVAL_SUBMODE_BASE), pushMode(COMMAND_EVAL_SUBMODE_FIELD); // implemented
COMMAND_MODE_EVENTCOUNT: 'eventcount' -> pushMode(COMMAND_EVENTCOUNT_MODE);
COMMAND_MODE_EVENTSTATS: 'eventstats' -> pushMode(COMMAND_EVENTSTATS_MODE);
COMMAND_MODE_EXPLAIN: 'explain' -> pushMode(COMMAND_EXPLAIN_MODE);
COMMAND_MODE_EXTRACT: 'extract' -> pushMode(COMMAND_EXTRACT_MODE);
COMMAND_MODE_FIELDFORMAT: 'fieldformat' -> pushMode(COMMAND_FIELDFORMAT_MODE);
COMMAND_MODE_FIELDS: 'fields' -> pushMode(COMMAND_FIELDS_MODE);
COMMAND_MODE_FIELDSUMMARY: 'fieldsummary' -> pushMode(COMMAND_FIELDSUMMARY_MODE);
COMMAND_MODE_FILLDOWN: 'filldown' -> pushMode(COMMAND_FILLDOWN_MODE);
COMMAND_MODE_FILLNULL: 'fillnull' -> pushMode(COMMAND_FILLNULL_MODE);
COMMAND_MODE_FINDKEYWORDS: 'findkeywords' -> pushMode(COMMAND_FINDKEYWORDS_MODE);
COMMAND_MODE_FINDTYPES: 'findtypes' -> pushMode(COMMAND_FINDTYPES_MODE);
COMMAND_MODE_FOLDERIZE: 'folderize' -> pushMode(COMMAND_FOLDERIZE_MODE);
COMMAND_MODE_FOREACH: 'foreach' -> pushMode(COMMAND_FOREACH_MODE);
COMMAND_MODE_FORMAT: 'format' -> pushMode(COMMAND_FORMAT_MODE);
COMMAND_MODE_FROM: 'from' -> pushMode(COMMAND_FROM_MODE);
COMMAND_MODE_GAUGE: 'gauge' -> pushMode(COMMAND_GAUGE_MODE);
COMMAND_MODE_GENTIMES: 'gentimes' -> pushMode(COMMAND_GENTIMES_MODE);
COMMAND_MODE_GEOM: 'geom' -> pushMode(COMMAND_GEOM_MODE);
COMMAND_MODE_GEOMFILTER: 'geomfilter' -> pushMode(COMMAND_GEOMFILTER_MODE);
COMMAND_MODE_GEOSTATS: 'geostats' -> pushMode(COMMAND_GEOSTATS_MODE);
COMMAND_MODE_HEAD: 'head' -> pushMode(COMMAND_HEAD_MODE);
COMMAND_MODE_HIGHLIGHT: 'highlight' -> pushMode(COMMAND_HIGHLIGHT_MODE);
COMMAND_MODE_HISTORY: 'history' -> pushMode(COMMAND_HISTORY_MODE);
COMMAND_MODE_ICONIFY: 'iconify' -> pushMode(COMMAND_ICONIFY_MODE);
COMMAND_MODE_INPUTCSV: 'inputcsv' -> pushMode(COMMAND_INPUTCSV_MODE);
COMMAND_MODE_INPUTLOOKUP: 'inputlookup' -> pushMode(COMMAND_INPUTLOOKUP_MODE);
COMMAND_MODE_IPLOCATION: 'iplocation' -> pushMode(COMMAND_IPLOCATION_MODE);
COMMAND_MODE_JOIN: 'join' -> pushMode(COMMAND_JOIN_MODE);
COMMAND_MODE_KMEANS: 'kmeans' -> pushMode(COMMAND_KMEANS_MODE);
COMMAND_MODE_KVFORM: 'kvform' -> pushMode(COMMAND_KVFORM_MODE);
COMMAND_MODE_LOADJOB: 'loadjob' -> pushMode(COMMAND_LOADJOB_MODE);
COMMAND_MODE_LOCALIZE: 'localize' -> pushMode(COMMAND_LOCALIZE_MODE);
COMMAND_MODE_LOCALOP: 'localop' -> pushMode(COMMAND_LOCALOP_MODE);
COMMAND_MODE_LOOKUP: 'lookup' -> pushMode(COMMAND_LOOKUP_MODE);
COMMAND_MODE_MAKECONTINUOUS: 'makecontinuous' -> pushMode(COMMAND_MAKECONTINUOUS_MODE);
COMMAND_MODE_MAKEJSON: 'makejson' -> pushMode(COMMAND_MAKEJSON_MODE);
COMMAND_MODE_MAKEMV: 'makemv' -> pushMode(COMMAND_MAKEMV_MODE);
COMMAND_MODE_MAKERESULTS: 'makeresults' -> pushMode(COMMAND_MAKERESULTS_MODE);
COMMAND_MODE_MAP: 'map' -> pushMode(COMMAND_MAP_MODE);
COMMAND_MODE_MCATALOG: 'mcatalog' -> pushMode(COMMAND_MCATALOG_MODE);
COMMAND_MODE_MCOLLECT: 'mcollect' -> pushMode(COMMAND_MCOLLECT_MODE);
COMMAND_MODE_METADATA: 'metadata' -> pushMode(COMMAND_METADATA_MODE);
COMMAND_MODE_METASEARCH: 'metasearch' -> pushMode(COMMAND_METASEARCH_MODE);
COMMAND_MODE_MEVENTCOLLECT: 'meventcollect' -> pushMode(COMMAND_MEVENTCOLLECT_MODE);
COMMAND_MODE_MSTATS: 'mstats' -> pushMode(COMMAND_MSTATS_MODE);
COMMAND_MODE_MULTIKV: 'multikv' -> pushMode(COMMAND_MULTIKV_MODE);
COMMAND_MODE_MULTISEARCH: 'multisearch' -> pushMode(COMMAND_MULTISEARCH_MODE);
COMMAND_MODE_MVCOMBINE: 'mvcombine' -> pushMode(COMMAND_MVCOMBINE_MODE);
COMMAND_MODE_MVEXPAND: 'mvexpand' -> pushMode(COMMAND_MVEXPAND_MODE);
COMMAND_MODE_NOMV: 'nomv' -> pushMode(COMMAND_NOMV_MODE);
COMMAND_MODE_OUTLIER: 'outlier' -> pushMode(COMMAND_OUTLIER_MODE);
COMMAND_MODE_OUTPUTCSV: 'outputcsv' -> pushMode(COMMAND_OUTPUTCSV_MODE);
COMMAND_MODE_OUTPUTLOOKUP: 'outputlookup' -> pushMode(COMMAND_OUTPUTLOOKUP_MODE);
COMMAND_MODE_OUTPUTTEXT: 'outputtext' -> pushMode(COMMAND_OUTPUTTEXT_MODE);
COMMAND_MODE_OVERLAP: 'overlap' -> pushMode(COMMAND_OVERLAP_MODE);
COMMAND_MODE_PIVOT: 'pivot' -> pushMode(COMMAND_PIVOT_MODE);
COMMAND_MODE_PREDICT: 'predict' -> pushMode(COMMAND_PREDICT_MODE);
COMMAND_MODE_RANGEMAP: 'rangemap' -> pushMode(COMMAND_RANGEMAP_MODE);
COMMAND_MODE_RARE: 'rare' -> pushMode(COMMAND_RARE_MODE);
COMMAND_MODE_REDISTRIBUTE: 'redistribute' -> pushMode(COMMAND_REDISTRIBUTE_MODE);
COMMAND_MODE_REGEX: 'regex' -> pushMode(COMMAND_REGEX_MODE);
COMMAND_MODE_RELEVANCY: 'relevancy' -> pushMode(COMMAND_RELEVANCY_MODE);
COMMAND_MODE_RELTIME: 'reltime' -> pushMode(COMMAND_RELTIME_MODE);
COMMAND_MODE_RENAME: 'rename' -> pushMode(COMMAND_RENAME_MODE);
COMMAND_MODE_REPLACE: 'replace' -> pushMode(COMMAND_REPLACE_MODE);
COMMAND_MODE_REST: 'rest' -> pushMode(COMMAND_REST_MODE);
COMMAND_MODE_RETURN: 'return' -> pushMode(COMMAND_RETURN_MODE);
COMMAND_MODE_REVERSE: 'reverse' -> pushMode(COMMAND_REVERSE_MODE);
COMMAND_MODE_REX: 'rex' -> pushMode(COMMAND_REX_MODE);
COMMAND_MODE_REX4J: 'rex4j' -> pushMode(COMMAND_REX4J_MODE);
COMMAND_MODE_RTORDER: 'rtorder' -> pushMode(COMMAND_RTORDER_MODE);
COMMAND_MODE_RUNSHELLSCRIPT: 'runshellscript' -> pushMode(COMMAND_RUNSHELLSCRIPT_MODE);
COMMAND_MODE_SAVEDSEARCH: 'savedsearch' -> pushMode(COMMAND_SAVEDSEARCH_MODE);
COMMAND_MODE_SCRIPT: 'script' -> pushMode(COMMAND_SCRIPT_MODE);
COMMAND_MODE_SCRUB: 'scrub' -> pushMode(COMMAND_SCRUB_MODE);
COMMAND_MODE_SEARCH: 'search' -> pushMode(DEFAULT_MODE);
COMMAND_MODE_SEARCHTXN: 'searchtxn' -> pushMode(COMMAND_SEARCHTXN_MODE);
COMMAND_MODE_SELFJOIN: 'selfjoin' -> pushMode(COMMAND_SELFJOIN_MODE);
COMMAND_MODE_SENDALERT: 'sendalert' -> pushMode(COMMAND_SENDALERT_MODE);
COMMAND_MODE_SENDEMAIL: 'sendemail' -> pushMode(COMMAND_SENDEMAIL_MODE);
COMMAND_MODE_SET: 'set' -> pushMode(COMMAND_SET_MODE);
COMMAND_MODE_SETFIELDS: 'setfields' -> pushMode(COMMAND_SETFIELDS_MODE);
COMMAND_MODE_SICHART: 'sichart' -> pushMode(COMMAND_SICHART_MODE);
COMMAND_MODE_SIRARE: 'sirare' -> pushMode(COMMAND_SIRARE_MODE);
COMMAND_MODE_SISTATS: 'sistats' -> pushMode(COMMAND_SISTATS_MODE);
COMMAND_MODE_SITIMECHART: 'sitimechart' -> pushMode(COMMAND_SITIMECHART_MODE);
COMMAND_MODE_SITOP: 'sitop' -> pushMode(COMMAND_SITOP_MODE);
COMMAND_MODE_SORT: 'sort' -> pushMode(COMMAND_SORT_MODE);
COMMAND_MODE_SPATH: 'spath' -> pushMode(COMMAND_SPATH_MODE);
COMMAND_MODE_STATS: 'stats' -> pushMode(COMMAND_STATS_MODE);
COMMAND_MODE_STRCAT: 'strcat' -> pushMode(COMMAND_STRCAT_MODE);
COMMAND_MODE_STREAMSTATS: 'streamstats' -> pushMode(COMMAND_STREAMSTATS_MODE);
COMMAND_MODE_TABLE: 'table' -> pushMode(COMMAND_TABLE_MODE);
COMMAND_MODE_TAGS: 'tags' -> pushMode(COMMAND_TAGS_MODE);
COMMAND_MODE_TAIL: 'tail' -> pushMode(COMMAND_TAIL_MODE);
COMMAND_MODE_TERAGREP: 'teragrep' -> pushMode(COMMAND_TERAGREP_MODE);
COMMAND_MODE_TIMECHART: 'timechart' -> pushMode(COMMAND_TIMECHART_MODE); // implemented
COMMAND_MODE_TIMEWRAP: 'timewrap' -> pushMode(COMMAND_TIMEWRAP_MODE);
COMMAND_MODE_TOP: 'top' -> pushMode(COMMAND_TOP_MODE);
COMMAND_MODE_TRANSACTION: 'transaction' -> pushMode(COMMAND_TRANSACTION_MODE);
COMMAND_MODE_TRANSPOSE: 'transpose' -> pushMode(COMMAND_TRANSPOSE_MODE);
COMMAND_MODE_TRENDLINE: 'trendline' -> pushMode(COMMAND_TRENDLINE_MODE);
COMMAND_MODE_TSCOLLECT: 'tscollect' -> pushMode(COMMAND_TSCOLLECT_MODE);
COMMAND_MODE_TSTATS: 'tstats' -> pushMode(COMMAND_TSTATS_MODE);
COMMAND_MODE_TYPEAHEAD: 'typeahead' -> pushMode(COMMAND_TYPEAHEAD_MODE);
COMMAND_MODE_TYPELEARNER: 'typelearner' -> pushMode(COMMAND_TYPELEARNER_MODE);
COMMAND_MODE_TYPER: 'typer' -> pushMode(COMMAND_TYPER_MODE);
COMMAND_MODE_UNION: 'union' -> pushMode(COMMAND_UNION_MODE);
COMMAND_MODE_UNIQ: 'uniq' -> pushMode(COMMAND_UNIQ_MODE);
COMMAND_MODE_UNTABLE: 'untable' -> pushMode(COMMAND_UNTABLE_MODE);
COMMAND_MODE_WHERE: 'where' -> pushMode(EVAL_LANGUAGE_MODE); // implemented
COMMAND_MODE_X11: 'x11' -> pushMode(COMMAND_X11_MODE);
COMMAND_MODE_XMLKV: 'xmlkv' -> pushMode(COMMAND_XMLKV_MODE);
COMMAND_MODE_XMLUNESCAPE: 'xmlunescape' -> pushMode(COMMAND_XMLUNESCAPE_MODE);
COMMAND_MODE_XPATH: 'xpath' -> pushMode(COMMAND_XPATH_MODE);
COMMAND_MODE_XYSERIES: 'xyseries' -> pushMode(COMMAND_XYSERIES_MODE);

// -------------- COMMAND_MODE --------------

