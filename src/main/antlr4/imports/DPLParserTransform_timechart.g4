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
parser grammar DPLParserTransform_timechart;

timechartTransformation
        : COMMAND_MODE_TIMECHART (t_timechart_sepParameter | t_timechart_formatParameter | t_timechart_partialParameter | t_timechart_fixedrangeParameter | t_timechart_contParameter | t_timechart_limitParameter)*? (t_timechart_aggParameter t_timechart_fieldRenameInstruction?)*? (t_timechart_binOptParameter)*? ((aggregateFunction t_timechart_fieldRenameInstruction? | t_timechart_evaledField t_timechart_fieldRenameInstruction?) t_timechart_divideByInstruction?)+ t_timechart_dedupSplitParameter?
        ;

t_timechart_aggParameter
        : COMMAND_TIMECHART_MODE_AGG(((aggregateFunction | t_timechart_evaledField | fieldType)))
        ;

t_timechart_binOptParameter
        : t_timechart_spanOptParameter | t_timechart_binsParameter | t_timechart_binMinspanParameter | t_timechart_binStartEndParameter | t_timechart_binAligntimeParameter
        ;

t_timechart_spanOptParameter
        : t_timechart_binSpanParameter (aggregateMethodPerSecond | aggregateMethodPerHour | aggregateMethodPerDay | aggregateMethodPerMinute)*?
        ;

t_timechart_dedupSplitParameter
        : COMMAND_TIMECHART_MODE_DEDUP_SPLITVALS booleanType
        ;

t_timechart_fixedrangeParameter
        : COMMAND_TIMECHART_MODE_FIXEDRANGE booleanType
        ;

t_timechart_binSpanParameter
        : COMMAND_TIMECHART_MODE_SPAN spanType
        ;

t_timechart_binsParameter
        : COMMAND_TIMECHART_MODE_BINS integerType
        ;


t_timechart_binStartEndParameter
        : (COMMAND_TIMECHART_MODE_START|COMMAND_TIMECHART_MODE_END) numberType
        ;


t_timechart_contParameter
        : COMMAND_TIMECHART_MODE_CONT booleanType
        ;


t_timechart_formatParameter
        : COMMAND_TIMECHART_MODE_FORMAT stringType
        ;


t_timechart_limitParameter
        : COMMAND_TIMECHART_MODE_LIMIT (COMMAND_TIMECHART_SUBMODE_LIMIT_MODE_TOP_INT | COMMAND_TIMECHART_SUBMODE_LIMIT_MODE_BOTTOM_INT | COMMAND_TIMECHART_SUBMODE_LIMIT_MODE_INTEGER)
        ;


t_timechart_partialParameter
        : COMMAND_TIMECHART_MODE_PARTIAL booleanType
        ;


t_timechart_sepParameter
        : COMMAND_TIMECHART_MODE_SEP stringType
        ;

t_timechart_binMinspanParameter
        : COMMAND_TIMECHART_MODE_MINSPAN spanType
        ;

t_timechart_binAligntimeParameter
        : COMMAND_TIMECHART_MODE_ALIGNTIME timeType
        ;

t_timechart_divideByInstruction
        : (COMMAND_TIMECHART_MODE_BY) fieldType t_timechart_tcOpt*? (t_timechart_whereInstruction)?
        ;

t_timechart_tcOpt
        : t_timechart_binOptParameter
        | t_timechart_nullstrParameter
        | t_timechart_otherstrParameter
        | t_timechart_usenullParameter
        | t_timechart_useotherParameter
        ;

t_timechart_whereInstruction
        : (COMMAND_TIMECHART_MODE_WHERE) aggregateFunction (IN|COMMAND_TIMECHART_MODE_NOTIN) (COMMAND_TIMECHART_MODE_TOP|COMMAND_TIMECHART_MODE_BOTTOM) integerType
        | (COMMAND_TIMECHART_MODE_WHERE) aggregateFunction (COMMAND_TIMECHART_MODE_LT|COMMAND_TIMECHART_MODE_GT) numberType
        ;

t_timechart_nullstrParameter
        : COMMAND_TIMECHART_MODE_NULLSTR stringType
        ;

t_timechart_otherstrParameter
        : COMMAND_TIMECHART_MODE_OTHERSTR stringType
        ;

t_timechart_usenullParameter
        : COMMAND_TIMECHART_MODE_USENULL booleanType
        ;

t_timechart_useotherParameter
        : COMMAND_TIMECHART_MODE_USEOTHER booleanType
        ;


t_timechart_evaledField
        : COMMAND_TIMECHART_MODE_EVAL_PARENTHESIS_L evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ;

t_timechart_fieldRenameInstruction
        : (COMMAND_TIMECHART_MODE_AS) fieldType
        ;

