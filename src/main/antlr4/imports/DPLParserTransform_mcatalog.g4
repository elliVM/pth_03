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
parser grammar DPLParserTransform_mcatalog;

mcatalogTransformation
        : COMMAND_MODE_MCATALOG (t_mcatalog_prestatsParameter)? (t_mcatalog_appendParameter)? ((COMMAND_MCATALOG_MODE_VALUES COMMAND_MCATALOG_MODE_PARENTHESIS_L fieldType COMMAND_MCATALOG_MODE_PARENTHESIS_R) (COMMAND_MCATALOG_MODE_AS fieldType)) (t_mcatalog_whereParameter)? ((COMMAND_MCATALOG_MODE_WHERE_MODE_BY_BY|COMMAND_MCATALOG_MODE_WHERE_MODE_GROUPBY) fieldListType)?
        ;

t_mcatalog_appendParameter
        : COMMAND_MCATALOG_MODE_APPEND booleanType
        ;

t_mcatalog_prestatsParameter
        : COMMAND_MCATALOG_MODE_PRESTATS booleanType
        ;

t_mcatalog_whereParameter
        : COMMAND_MCATALOG_MODE_WHERE t_mcatalog_whereMcatalogStatement
        ;

t_mcatalog_whereMcatalogStatement
        : t_mcatalog_comparisonStatement
        | t_mcatalog_searchQualifier
        | t_mcatalog_indexStatement
        | t_mcatalog_timeStatement
        | COMMAND_MCATALOG_MODE_WHERE_MODE_NOT t_mcatalog_whereMcatalogStatement
        | t_mcatalog_whereMcatalogStatement COMMAND_MCATALOG_MODE_WHERE_MODE_OR t_mcatalog_whereMcatalogStatement
        ;

t_mcatalog_comparisonStatement
        : fieldOrStringType (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ|COMMAND_MCATALOG_MODE_WHERE_MODE_LT|COMMAND_MCATALOG_MODE_WHERE_MODE_LTE|COMMAND_MCATALOG_MODE_WHERE_MODE_GT|COMMAND_MCATALOG_MODE_WHERE_MODE_GTE) (integerType|stringType)
        | fieldValueInListStatement
        ;

t_mcatalog_searchQualifier
       : COMMAND_MCATALOG_MODE_WHERE_MODE_INDEX (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_SOURCETYPE (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_HOST (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_SOURCE (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_SAVEDSEARCH (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_EVENTTYPE (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_EVENTTYPETAG (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_HOSTTAG (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       | COMMAND_MCATALOG_MODE_WHERE_MODE_TAG (COMMAND_MCATALOG_MODE_WHERE_MODE_EQ|COMMAND_MCATALOG_MODE_WHERE_MODE_NEQ) stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
       ;

t_mcatalog_indexStatement
        : stringType COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD?
        | COMMAND_MCATALOG_MODE_WHERE_MODE_WILDCARD
        ;

t_mcatalog_timeStatement
        : timeFormatQualifier? (timeQualifier)
        ;

timeFormatQualifier
        : COMMAND_MCATALOG_MODE_WHERE_MODE_TIMEFORMAT stringType //FIXME implement Time Properties
        ;

timeQualifier
        : COMMAND_MCATALOG_MODE_WHERE_MODE_EARLIEST timeType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_INDEX_EARLIEST stringType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_STARTTIME stringType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_STARTDAYSAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_STARTMINUTESAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_STARTHOURSAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_STARTMONTHSAGO  integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_STARTTIMEU integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_LATEST timeType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_INDEX_LATEST stringType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_ENDTIME stringType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_ENDDAYSAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_ENDMINUTESAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_ENDHOURSAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_ENDMONTHSAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_ENDTIMEU integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANHOURS integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANMINUTES integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANDAYS integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_SEARCHTIMESPANMONHTS integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_DAYSAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_MINUTESAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_HOURSAGO integerType
        | COMMAND_MCATALOG_MODE_WHERE_MODE_MONTHSAGO integerType
        ;