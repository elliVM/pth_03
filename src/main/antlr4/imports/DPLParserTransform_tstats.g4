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
parser grammar DPLParserTransform_tstats;

tstatsTransformation //fix from section with where clause
        : COMMAND_MODE_TSTATS (t_tstats_prestatsParameter)? (t_tstats_localParameter)? (t_tstats_appendParameter)? (t_tstats_summariesonlyParameter)? (t_tstats_include_reduced_bucketsParameter)? (t_tstats_allowOldSummariesParameter)? (t_tstats_chunksizeParameter)? t_tstats_fillnull_valueParameter? (t_tstats_statsfunctionInstruction)+ tstats_fromOptions? t_tstats_whereParameter? (COMMAND_TSTATS_MODE_BY (fieldListType | t_tstats_prefixParameter) t_tstats_spanParameter?)?
        ;

tstats_fromOptions
        : COMMAND_TSTATS_MODE_FROM (stringType | t_tstats_sidParameter | (t_tstats_datamodelParameter (COMMAND_TSTATS_MODE_WHERE t_tstats_nodenameParameter)? ) )
        ;

t_tstats_allowOldSummariesParameter
        : COMMAND_TSTATS_MODE_ALLOW_OLD_SUMMARIES booleanType
        ;

t_tstats_fillnull_valueParameter
        : COMMAND_TSTATS_MODE_FILLNULL_VALUE stringType
        ;

t_tstats_appendParameter
        : COMMAND_TSTATS_MODE_APPEND booleanType
        ;

t_tstats_chunksizeParameter
        : COMMAND_TSTATS_MODE_CHUNKSIZE integerType
        ;

t_tstats_datamodelParameter // COMMAND_MODE_TSTATS
        : COMMAND_TSTATS_MODE_DATAMODEL stringType
        ;

t_tstats_localParameter
        : COMMAND_TSTATS_MODE_LOCAL booleanType
        ;

t_tstats_prestatsParameter
        : COMMAND_TSTATS_MODE_PRESTATS booleanType
        ;

t_tstats_sidParameter
        : COMMAND_TSTATS_MODE_SID stringType
        ;

t_tstats_spanParameter
        : COMMAND_TSTATS_MODE_SPAN spanType
        ;

t_tstats_summariesonlyParameter
        : COMMAND_TSTATS_MODE_SUMMARIESONLY booleanType
        ;

t_tstats_include_reduced_bucketsParameter
        : COMMAND_TSTATS_MODE_INCLUDE_REDUCED_BUCKETS booleanType
        ;

t_tstats_fieldRenameInstruction
        : (COMMAND_TSTATS_MODE_AS) fieldType
        ;

t_tstats_statsfunctionInstruction
        : aggregateFunction (t_tstats_fieldRenameInstruction)?
        ;

t_tstats_prefixParameter
        : COMMAND_TSTATS_MODE_PREFIX stringType COMMAND_TSTATS_MODE_PARENTHESIS_R
        ;

t_tstats_nodenameParameter //FIXME
        : COMMAND_TSTATS_MODE_NODENAME stringType
        ;

t_tstats_whereParameter
        : COMMAND_TSTATS_MODE_WHERE ((tstats_indexStatement|tstats_searchQualifier|) | (fieldType (COMMAND_TSTATS_MODE_IN COMMAND_TSTATS_MODE_PARENTHESIS_L? fieldType (COMMA? fieldType)*) COMMAND_TSTATS_MODE_PARENTHESIS_R? ) )
        ;

tstats_indexStatement
        : stringType WILDCARD?
        | WILDCARD
        | tstats_termStatement
        | tstats_caseStatement
        ;

tstats_searchQualifier
        : COMMAND_TSTATS_MODE_INDEX (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_SOURCETYPE (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_HOST (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_SOURCE (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_SAVEDSEARCH (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_EVENTTYPE (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_EVENTTYPETAG (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_HOSTTAG (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType? WILDCARD?
        | COMMAND_TSTATS_MODE_TAG (COMMAND_TSTATS_MODE_EQ|COMMAND_TSTATS_MODE_NEQ) stringType WILDCARD?
        ;

tstats_termStatement
        : COMMAND_TSTATS_MODE_TERM COMMAND_TSTATS_MODE_PARENTHESIS_L stringType COMMAND_TSTATS_MODE_PARENTHESIS_R
        ;

tstats_caseStatement
        : COMMAND_TSTATS_MODE_CASE COMMAND_TSTATS_MODE_PARENTHESIS_L stringType COMMAND_TSTATS_MODE_PARENTHESIS_R
        ;