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
parser grammar DPLParserTransform_anomalydetection;

anomalydetectionTransformation
        : COMMAND_MODE_ANOMALYDETECTION ((t_anomalydetection_method_AnomalydetectionParameter t_anomalydetection_action_AnomalydetectionParameter? t_anomalydetection_pthreshParameter?)|(t_anomalydetection_method_iqr_AnomalydetectionParameter t_anomalydetection_action_iqr_AnomalydetectionParameter?))?  t_anomalydetection_cutoffParameter? (fieldListType)?
        ;

t_anomalydetection_action_AnomalydetectionParameter
        : COMMAND_ANOMALYDETECTION_MODE_ACTION (COMMAND_ANOMALYDETECTION_MODE_GET_ACTION_MODE_ANNOTATE|COMMAND_ANOMALYDETECTION_MODE_GET_ACTION_MODE_FILTER|COMMAND_ANOMALYDETECTION_MODE_GET_ACTION_MODE_SUMMARY)
        ;

t_anomalydetection_method_iqr_AnomalydetectionParameter
        : COMMAND_ANOMALYDETECTION_MODE_METHOD (COMMAND_ANOMALYDETECTION_MODE_GET_METHOD_MODE_IQR)
        ;

t_anomalydetection_action_iqr_AnomalydetectionParameter
        : COMMAND_ANOMALYDETECTION_MODE_ACTION (COMMAND_ANOMALYDETECTION_MODE_GET_ACTION_MODE_TRANSFORM|COMMAND_ANOMALYDETECTION_MODE_GET_ACTION_MODE_REMOVE)
        ;

t_anomalydetection_method_AnomalydetectionParameter
        :COMMAND_ANOMALYDETECTION_MODE_METHOD (COMMAND_ANOMALYDETECTION_MODE_GET_METHOD_MODE_HISTOGRAM|COMMAND_ANOMALYDETECTION_MODE_GET_METHOD_MODE_ZSCORE)
        ;

t_anomalydetection_cutoffParameter
        : COMMAND_ANOMALYDETECTION_MODE_CUTOFF  booleanType
        ;

t_anomalydetection_pthreshParameter
        : COMMAND_ANOMALYDETECTION_MODE_PTHRESH  numberType
        ;



