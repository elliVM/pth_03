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
parser grammar DPLParserTransform_sitimechart;

sitimechartTransformation
        : COMMAND_MODE_SITIMECHART (t_sitimechart_sepParameter | t_sitimechart_partialParameter | t_sitimechart_contParameter | t_sitimechart_limitParameter | t_sitimechart_aggParameter)*? (t_sitimechart_binOptions)* ((aggregateFunction t_sitimechart_fieldRenameInstruction? | (EVAL_LANGUAGE_MODE_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R) t_sitimechart_fieldRenameInstruction? ) t_sitimechart_divideByInstruction?)+
        ;

t_sitimechart_aggParameter
        : COMMAND_SITIMECHART_MODE_AGG(((aggregateFunction | t_sitimechart_evaledField )) t_sitimechart_fieldRenameInstruction?)
        ;

t_sitimechart_binStartEndParameter
        : (COMMAND_SITIMECHART_MODE_START|COMMAND_SITIMECHART_MODE_END) numberType
        ;

t_sitimechart_contParameter
        : COMMAND_SITIMECHART_MODE_CONT booleanType
        ;

t_sitimechart_limitParameter
        : COMMAND_SITIMECHART_MODE_LIMIT integerType
        ;

t_sitimechart_partialParameter
        : COMMAND_SITIMECHART_MODE_PARTIAL booleanType
        ;

t_sitimechart_sepParameter
        : COMMAND_SITIMECHART_MODE_SEP stringType
        ;

t_sitimechart_divideByInstruction
        : (COMMAND_SITIMECHART_MODE_BY) fieldType (t_sitimechart_binOptions | t_sitimechart_usenullParameter | t_sitimechart_useotherParameter | t_sitimechart_nullstrParameter | t_sitimechart_otherstrParameter)* (t_sitimechart_whereInstruction)?
        ;

t_sitimechart_whereInstruction
        : (COMMAND_SITIMECHART_MODE_WHERE) aggregateFunction (IN|COMMAND_SITIMECHART_MODE_NOTIN) (COMMAND_SITIMECHART_MODE_TOP|COMMAND_SITIMECHART_MODE_BOTTOM) integerType
        | (COMMAND_SITIMECHART_MODE_WHERE) aggregateFunction (COMMAND_SITIMECHART_MODE_LT|COMMAND_SITIMECHART_MODE_GT) numberType
        ;

t_sitimechart_binOptions
        : (t_sitimechart_spanOptParameter | t_sitimechart_binsParameter | t_sitimechart_minspanParameter | t_sitimechart_spanParameter | t_sitimechart_binStartEndParameter | t_sitimechart_binAligntimeParameter)
        ;

t_sitimechart_spanOptParameter
        : t_sitimechart_spanParameter (aggregateMethodPerSecond | aggregateMethodPerHour | aggregateMethodPerDay | aggregateMethodPerMinute)*?
        ;

t_sitimechart_binsParameter
        : COMMAND_SITIMECHART_MODE_BINS integerType
        ;

t_sitimechart_binAligntimeParameter
        : COMMAND_SITIMECHART_MODE_ALIGNTIME timeType
        ;

t_sitimechart_minspanParameter
        : COMMAND_SITIMECHART_MODE_MINSPAN spanType
        ;

t_sitimechart_nullstrParameter
        : COMMAND_SITIMECHART_MODE_NULLSTR stringType
        ;

t_sitimechart_otherstrParameter
        : COMMAND_SITIMECHART_MODE_OTHERSTR stringType
        ;

t_sitimechart_spanParameter
        : COMMAND_SITIMECHART_MODE_SPAN spanType
        ;

t_sitimechart_usenullParameter
        : COMMAND_SITIMECHART_MODE_USENULL booleanType
        ;

t_sitimechart_useotherParameter
        : COMMAND_SITIMECHART_MODE_OTHER booleanType
        ;


t_sitimechart_evaledField
        : COMMAND_SITIMECHART_MODE_EVAL_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

t_sitimechart_fieldRenameInstruction
        : (COMMAND_SITIMECHART_MODE_AS) fieldType
        ;
