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
parser grammar DPLParserTransform_mstats;

mstatsTransformation
        : COMMAND_MODE_MSTATS (t_mstats_chartParameter)? (t_mstats_chartoptionsParameter)*? (t_mstats_prestatsParameter)? (t_mstats_appendParameter)? (t_mstats_backfill_valueParameter)? (t_mstats_update_periodParameter)? (t_mstats_fillnull_valueParameter)? (t_mstats_chunck_sizeParameter)? (t_mstats_aggregationInstruction)+ (t_mstats_whereParameter)*? t_byStatement? t_spanLength?
        ;

t_mstats_appendParameter
        : COMMAND_MSTATS_MODE_APPEND booleanType
        ;

t_mstats_chartParameter
        : COMMAND_MSTATS_MODE_CHART booleanType
        ;
t_mstats_fillnull_valueParameter
        : COMMAND_MSTATS_MODE_FILLNULL_VALUE stringType
        ;

t_mstats_backfill_valueParameter
        : COMMAND_MSTATS_MODE_BACKFILL booleanType
        ;
t_mstats_prestatsParameter
        : COMMAND_MSTATS_MODE_PRESTATS booleanType
        ;

t_mstats_chunck_sizeParameter
        : COMMAND_MSTATS_MODE_CHUNK_SIZE integerType
        ;

t_mstats_whereParameter
        : COMMAND_MSTATS_MODE_WHERE t_mstats_whereMcatalogStatement
        ;

t_mstats_update_periodParameter
        : COMMAND_MSTATS_MODE_UPDATE_PERIOD integerType
        ;


t_mstats_fieldRenameInstruction
        : (COMMAND_MSTATS_MODE_AS) fieldType
        ;

t_mstats_aggregationInstruction
        : aggregateFunction (t_mstats_fieldRenameInstruction)?
        ;

t_mstats_chartoptionsParameter
        : t_mstats_chartlimitParameter
        | t_mstats_chartnullstrParameter
        | t_mstats_chartotherstrParameter
        | t_mstats_chartusenullParameter
        | t_mstats_chartuseotherParameter
        | t_mstats_chartaggParameter
        ;


t_mstats_chartlimitParameter
        : (COMMAND_MSTATS_SUBMODE_CHART_LIMIT_TOP |COMMAND_MSTATS_SUBMODE_CHART_LIMIT_BOTTOM |COMMAND_MSTATS_SUBMODE_CHART_LIMIT)  integerType
        ;
t_mstats_chartnullstrParameter
        : COMMAND_MSTATS_MODE_CHART_NULLSTR stringType
        ;
t_mstats_chartotherstrParameter
        : COMMAND_MSTATS_MODE_CHART_OTHERSTR stringType
        ;
t_mstats_chartusenullParameter
        : COMMAND_MSTATS_MODE_CHART_USENULL booleanType
        ;
t_mstats_chartuseotherParameter
        : COMMAND_MSTATS_MODE_CHART_USEOTHER booleanType
        ;
t_mstats_chartaggParameter
        : t_chart_aggregationInstruction
        ;
t_byStatement
        : (COMMAND_MSTATS_MODE_WHERE_MODE_GROUPBY|COMMAND_MSTATS_MODE_WHERE_MODE_BY_BY) fieldListType
        ;

t_spanLength
        : (COMMAND_MSTATS_MODE_SPAN spanType) (COMMAND_MSTATS_MODE_EVERY spanType)?
        ;

t_mstats_whereMcatalogStatement
        : t_mstats_comparisonStatement
        | t_mstats_searchQualifier
        | t_mstats_indexStatement
        | t_mstats_timeStatement
        | COMMAND_MSTATS_MODE_WHERE_MODE_NOT t_mstats_whereMcatalogStatement
        | t_mstats_whereMcatalogStatement COMMAND_MSTATS_MODE_WHERE_MODE_OR t_mstats_whereMcatalogStatement
        ;

t_mstats_comparisonStatement
        : fieldOrStringType (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ|COMMAND_MSTATS_MODE_WHERE_MODE_LT|COMMAND_MSTATS_MODE_WHERE_MODE_LTE|COMMAND_MSTATS_MODE_WHERE_MODE_GT|COMMAND_MSTATS_MODE_WHERE_MODE_GTE) (integerType|stringType)
        | fieldValueInListStatement
        ;

t_mstats_searchQualifier
       : COMMAND_MSTATS_MODE_WHERE_MODE_INDEX (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_SOURCETYPE (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_HOST (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_SOURCE (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_SAVEDSEARCH (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_EVENTTYPE (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_EVENTTYPETAG (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_HOSTTAG (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MSTATS_MODE_WHERE_MODE_TAG (COMMAND_MSTATS_MODE_WHERE_MODE_EQ|COMMAND_MSTATS_MODE_WHERE_MODE_NEQ) stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
       ;

t_mstats_indexStatement
        : stringType COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD?
        | COMMAND_MSTATS_MODE_WHERE_MODE_WILDCARD
        ;

t_mstats_timeStatement
        : timeFormatQualifier? (timeQualifier)
        ;

timeFormatQualifier
        : COMMAND_MSTATS_MODE_WHERE_MODE_TIMEFORMAT stringType //FIXME implement Time Properties
        ;

timeQualifier
        : COMMAND_MSTATS_MODE_WHERE_MODE_EARLIEST timeType
        | COMMAND_MSTATS_MODE_WHERE_MODE_INDEX_EARLIEST stringType
        | COMMAND_MSTATS_MODE_WHERE_MODE_STARTTIME stringType
        | COMMAND_MSTATS_MODE_WHERE_MODE_STARTDAYSAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_STARTMINUTESAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_STARTHOURSAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_STARTMONTHSAGO  integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_STARTTIMEU integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_LATEST timeType
        | COMMAND_MSTATS_MODE_WHERE_MODE_INDEX_LATEST stringType
        | COMMAND_MSTATS_MODE_WHERE_MODE_ENDTIME stringType
        | COMMAND_MSTATS_MODE_WHERE_MODE_ENDDAYSAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_ENDMINUTESAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_ENDHOURSAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_ENDMONTHSAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_ENDTIMEU integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANHOURS integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANMINUTES integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANDAYS integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_SEARCHTIMESPANMONHTS integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_DAYSAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_MINUTESAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_HOURSAGO integerType
        | COMMAND_MSTATS_MODE_WHERE_MODE_MONTHSAGO integerType
        ;        
