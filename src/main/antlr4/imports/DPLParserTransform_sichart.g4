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
parser grammar DPLParserTransform_sichart;

sichartTransformation
        : COMMAND_MODE_SICHART (t_sichart_sepChartParameter|t_sichart_formatParameter|t_sichart_contParameter|t_sichart_limitParameter|t_sichart_aggParameter)* (t_sichart_aggregationInstruction|t_sichart_sparklineAggregationInstruction|COMMAND_SICHART_MODE_PARENTHESIS_L evalStatement COMMAND_SICHART_MODE_PARENTHESIS_R)+ ((t_sichart_overInstruction (t_sichart_divideByInstruction)?)|(t_sichart_divideByInstruction))?
        ;


t_sichart_aggParameter
        : COMMAND_SICHART_MODE_AGG t_sichart_aggregationInstruction
        ;

t_sichart_contParameter
        : COMMAND_SICHART_MODE_CONT booleanType
        ;


t_sichart_formatParameter
        : COMMAND_SICHART_MODE_FORMAT stringType
        ;


t_sichart_limitParameter
        : COMMAND_SICHART_MODE_LIMIT (COMMAND_SICHART_MODE_TOP | COMMAND_SICHART_MODE_BOTTOM)integerType
        ;


t_sichart_sepChartParameter
        : COMMAND_SICHART_MODE_SEP stringType
        ;

t_sichart_sparklineAggregationInstruction
        : COMMAND_SICHART_MODE_SPARKLINE t_sichart_aggregationInstruction (COMMAND_SICHART_SUBMODE_SPARKLINE_COMMA spanType)? COMMAND_SICHART_SUBMODE_SPARKLINE_PARENTHESIS_R
        ;

t_sichart_divideByInstruction
        : (COMMAND_SICHART_MODE_BY) fieldType (t_sichart_binsParameter|t_sichart_minspanParameter|t_sichart_spanParameter|t_sichart_startParameter|t_sichart_endParameter|t_sichart_alignTimeParameter|t_sichart_usenullParameter|t_sichart_useotherParameter|t_sichart_nullstrParameter|t_sichart_otherstrParameter)* (t_sichart_whereInstruction)?
        ;

t_sichart_whereInstruction
        : (COMMAND_SICHART_MODE_WHERE) aggregateFunction (IN|COMMAND_SICHART_MODE_NOTIN) (COMMAND_SICHART_MODE_TOP|COMMAND_SICHART_MODE_BOTTOM) integerType ((COMMAND_SICHART_MODE_Or|COMMAND_SICHART_MODE_And|COMMAND_SICHART_MODE_Xor) aggregateFunction (IN|COMMAND_SICHART_MODE_NOTIN) (COMMAND_SICHART_MODE_TOP|COMMAND_SICHART_MODE_BOTTOM) integerType)*
        | (COMMAND_SICHART_MODE_WHERE) aggregateFunction (COMMAND_SICHART_MODE_LT|COMMAND_SICHART_MODE_GT) integerType ((COMMAND_SICHART_MODE_Or|COMMAND_SICHART_MODE_And|COMMAND_SICHART_MODE_Xor) aggregateFunction (COMMAND_SICHART_MODE_LT|COMMAND_SICHART_MODE_GT) integerType)*
        ;

t_sichart_overInstruction
        : (COMMAND_SICHART_MODE_OVER) fieldType (t_sichart_binsParameter|t_sichart_minspanParameter|t_sichart_spanParameter|t_sichart_startParameter|t_sichart_endParameter|t_sichart_alignTimeParameter)*
        ;


t_sichart_alignTimeParameter
        : COMMAND_SICHART_MODE_ALIGNTIME stringType
        ;


t_sichart_binsParameter
        : COMMAND_SICHART_MODE_BINS integerType
        ;


t_sichart_endParameter
        : COMMAND_SICHART_MODE_END numberType
        ;


t_sichart_minspanParameter
        : COMMAND_SICHART_MODE_MINSPAN spanType
        ;


t_sichart_nullstrParameter
        : COMMAND_SICHART_MODE_NULLSTR stringType
        ;


t_sichart_otherstrParameter
        : COMMAND_SICHART_MODE_OTHERSTR stringType
        ;


t_sichart_spanParameter
        : COMMAND_SICHART_MODE_SPAN spanType
        ;


t_sichart_startParameter
        : COMMAND_SICHART_MODE_START numberType
        ;


t_sichart_usenullParameter
        : COMMAND_SICHART_MODE_USENULL booleanType
        ;


t_sichart_useotherParameter
        : COMMAND_SICHART_MODE_USEOTHER booleanType
        ;

t_sichart_fieldRenameInstruction
        : (COMMAND_SICHART_MODE_AS) fieldType
        ;

t_sichart_aggregationInstruction
        : aggregateFunction (t_sichart_fieldRenameInstruction)?
        ;
