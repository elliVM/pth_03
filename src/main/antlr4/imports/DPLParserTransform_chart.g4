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
parser grammar DPLParserTransform_chart;

chartTransformation
        : COMMAND_MODE_CHART  t_chart_optionsParameter*? t_chart_aggParameter*? (t_chart_aggregationInstruction | t_chart_sparklineAggregationInstruction | (COMMAND_CHART_MODE_PARENTHESIS_L evalStatement COMMAND_CHART_MODE_PARENTHESIS_R)) (COMMA? (t_chart_aggregationInstruction|t_chart_sparklineAggregationInstruction|(COMMAND_CHART_MODE_PARENTHESIS_L evalStatement COMMAND_CHART_MODE_PARENTHESIS_R)))*? ( t_chart_by_column_rowOptions | ((t_chart_over_row_Options) (t_chart_by_column_Options)) )* t_chart_dedup_splitvalsParameter?
        ;

t_chart_optionsParameter
        : (t_chart_contParameter | t_chart_formatParameter | t_chart_limitParameter | t_chart_sepChartParameter)
        ;

t_chart_bin_options
        : (t_chart_binsParameter | t_chart_spanParameter | t_chart_alignTimeParameter |t_chart_endParameter | t_chart_startParameter)
        ;

t_chart_tc_Options
        : (t_chart_bin_options | t_chart_usenullParameter| t_chart_useotherParameter| t_chart_nullstrParameter | t_chart_otherstrParameter)
        ;

t_row_Parameter
        : fieldType (COMMA? fieldType)*? t_chart_bin_options*
        ;

t_column_Parameter
        : fieldType t_chart_tc_Options* t_chart_whereInstruction?
        ;

t_chart_aggParameter
        : COMMAND_CHART_MODE_AGG t_chart_aggregationInstruction
        ;

t_chart_by_column_rowOptions
        : COMMAND_CHART_MODE_BY t_row_Parameter? t_column_Parameter?
        ;

t_chart_by_column_Options
        : COMMAND_CHART_MODE_BY t_column_Parameter?
        ;

t_chart_over_row_Options
        : COMMAND_CHART_MODE_OVER t_row_Parameter?
        ;

t_chart_sparklineAggregationInstruction
        : COMMAND_CHART_MODE_SPARKLINE t_chart_aggregationInstruction (COMMA spanType)? COMMAND_CHART_SUBMODE_SPARKLINE_PARENTHESIS_R
        ;

t_chart_whereInstruction
        : (COMMAND_CHART_MODE_WHERE) (aggregateFunction ) (IN|COMMAND_CHART_MODE_NOTIN) (COMMAND_CHART_MODE_TOP|COMMAND_CHART_MODE_BOTTOM) integerType
        | (COMMAND_CHART_MODE_WHERE) (aggregateFunction ) (COMMAND_CHART_MODE_LT|COMMAND_CHART_MODE_GT) numberType
        ;

t_chart_alignTimeParameter
        : COMMAND_CHART_MODE_ALIGNTIME timeType
        ;

t_chart_binsParameter
        : COMMAND_CHART_MODE_BINS integerType
        ;

t_chart_endParameter
        : COMMAND_CHART_MODE_END numberType
        ;

t_chart_nullstrParameter
        : COMMAND_CHART_MODE_NULLSTR stringType
        ;

t_chart_otherstrParameter
        : COMMAND_CHART_MODE_OTHERSTR stringType
        ;

t_chart_spanParameter
        : COMMAND_CHART_MODE_SPAN spanType
        ;

t_chart_startParameter
        : COMMAND_CHART_MODE_START numberType
        ;

t_chart_usenullParameter
        : COMMAND_CHART_MODE_USENULL booleanType
        ;


t_chart_useotherParameter
        : COMMAND_CHART_MODE_USEOTHER booleanType
        ;


t_chart_fieldRenameInstruction
        : (COMMAND_CHART_MODE_AS) fieldType
        ;

t_chart_aggregationInstruction
        : ( aggregateFunction ) (t_chart_fieldRenameInstruction)?
        ;

t_chart_dedup_splitvalsParameter
        : COMMAND_CHART_MODE_DEDUP_SPLITVALS booleanType
        ;

t_chart_contParameter
        : COMMAND_CHART_MODE_CONT booleanType
        ;

t_chart_formatParameter
        : COMMAND_CHART_MODE_FORMAT stringType
        ;

t_chart_limitParameter
        : COMMAND_CHART_MODE_LIMIT (COMMAND_CHART_SUBMODE_LIMIT_MODE_INTEGER | COMMAND_CHART_SUBMODE_LIMIT_MODE_TOP_INT | COMMAND_CHART_SUBMODE_LIMIT_MODE_BOTTOM_INT)
        ;

t_chart_sepChartParameter
        : COMMAND_CHART_MODE_SEP stringType
        ;

