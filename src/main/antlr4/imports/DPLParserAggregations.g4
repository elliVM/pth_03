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
parser grammar DPLParserAggregations;

// aggregations
aggregateFunction
        : aggregateMethodAvg
        | aggregateMethodCount
        | aggregateMethodDistinctCount
        | aggregateMethodEarliest
        | aggregateMethodEarliestTime
        | aggregateMethodEstimatedDistinctCount
        | aggregateMethodEstimatedDistinctErrorCount
        | aggregateMethodFirst
        | aggregateMethodLast
        | aggregateMethodLatest
        | aggregateMethodLatestTime
        | aggregateMethodList
        | aggregateMethodMax
        | aggregateMethodMedian
        | aggregateMethodMin
        | aggregateMethodMode
        | aggregateMethodPercentile
        | aggregateMethodPercentileVariable
        | aggregateMethodRange
        | aggregateMethodRate
        | aggregateMethodStandardDeviation
        | aggregateMethodSum
        | aggregateMethodSumSquare
        | aggregateMethodValues
        | aggregateMethodVariance
        | aggregateMethodPercint
        | aggregateMethodPerSecond
        | aggregateMethodPerHour
        | aggregateMethodPerDay
        | aggregateMethodPerMinute
        ;

/*
FIXME, arguments for different methods are not as they should be
they are currently just '"method(" aggregate_fieldType ")"' where ")" pops the mode.
*/
/*
FIXME, per_second etc needs to be implemented
like
t_timechart_binAggTimeParameter
        : (COMMAND_TIMECHART_MODE_PER_SECOND(aggregateFunction) | COMMAND_TIMECHART_MODE_PER_MINUTE(aggregateFunction)| COMMAND_TIMECHART_MODE_PER_HOUR(aggregateFunction)| COMMAND_TIMECHART_MODE_PER_DAY(aggregateFunction))
        ;
add this to parsers for the special agg method
t_timechart_spanOptParameter
        : t_timechart_binSpanParameter (aggregateMethodPerSecond | aggregateMethodPerHour | aggregateMethodPerDay | aggregateMethodPerMinute)*?
        ;
*/
aggregateMethodAvg
        : (METHOD_AGGREGATE_AVG|METHOD_AGGREGATE_MEAN) (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ; 


aggregateMethodCount
        : METHOD_AGGREGATE_COUNT | METHOD_AGGREGATE_COUNT_C
        | ((METHOD_AGGREGATE_C|METHOD_AGGREGATE_COUNT_B) ( (METHOD_AGGREGATE_EVAL_L  evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R)
        | aggregate_fieldType ) METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodDistinctCount
        : (METHOD_AGGREGATE_DC|METHOD_AGGREGATE_DISTINCT_COUNT) (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodEarliest
        : METHOD_AGGREGATE_EARLIEST (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodEarliestTime
        : METHOD_AGGREGATE_EARLIEST_TIME (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodEstimatedDistinctCount
        : METHOD_AGGREGATE_ESTDC (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodEstimatedDistinctErrorCount
        : METHOD_AGGREGATE_ESTDC_ERROR (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodFirst
        : METHOD_AGGREGATE_FIRST (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodLast
        : METHOD_AGGREGATE_LAST (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodLatest
        : METHOD_AGGREGATE_LATEST (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodLatestTime
        : METHOD_AGGREGATE_LATEST_TIME (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodList
        : METHOD_AGGREGATE_LIST (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodMax
        : METHOD_AGGREGATE_MAX (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodMedian
        : METHOD_AGGREGATE_MEDIAN (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodMin
        : METHOD_AGGREGATE_MIN (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodMode
        : METHOD_AGGREGATE_MODE (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodPercentile
        : (METHOD_AGGREGATE_P|METHOD_AGGREGATE_PERC|METHOD_AGGREGATE_EXACTPERC|METHOD_AGGREGATE_UPPERPERC) (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodPercentileVariable
        : (METHOD_AGGREGATE_P_VARIABLE
        |METHOD_AGGREGATE_PERC_VARIABLE
        |METHOD_AGGREGATE_EXACTPERC_VARIABLE
        |METHOD_AGGREGATE_UPPERPERC_VARIABLE) METHOD_AGGREGATE_PARENTHESIS_L aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R
        ;

aggregateMethodPercint
        : METHOD_AGGREGATE_PERCINT (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodPerSecond
        : METHOD_AGGREGATE_PER_SECOND (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodPerHour
        : METHOD_AGGREGATE_PER_HOUR (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodPerDay
        : METHOD_AGGREGATE_PER_DAY (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodPerMinute
        : METHOD_AGGREGATE_PER_MINUTE (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodRange
        : METHOD_AGGREGATE_RANGE (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodRate
        : METHOD_AGGREGATE_RATE (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodStandardDeviation
        : (METHOD_AGGREGATE_STDEV|METHOD_AGGREGATE_STDEVP) (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodSum
        : METHOD_AGGREGATE_SUM (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodSumSquare
        : METHOD_AGGREGATE_SUMSQ (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodValues
        : METHOD_AGGREGATE_VALUES (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregateMethodVariance
        : METHOD_AGGREGATE_VAR (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        | METHOD_AGGREGATE_VARP (evalStatement METHOD_AGGREGATE_PARENTHESIS_R?
        | aggregate_fieldType METHOD_AGGREGATE_PARENTHESIS_R)
        ;

aggregate_fieldType
        : METHOD_AGGREGATE_DQSTRING
        | METHOD_AGGREGATE_STRING_MATCH
        ;
