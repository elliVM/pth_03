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
parser grammar DPLParserTransform_collect;

collectTransformation
        : COMMAND_MODE_COLLECT t_collect_indexParameter (t_collect_addtimeParameter|t_collect_fileParameter|t_collect_spoolParameter|t_collect_markerParameter|t_collect_outputformatParameter|t_collect_testmodeParameter|t_collect_run_in_previewParameter|t_collect_hostParameter|t_collect_sourceParameter|t_collect_sourcetypeParameter)*?
        ;


t_collect_addtimeParameter
        : COMMAND_COLLECT_MODE_ADDTIME booleanType
        ;

t_collect_fileParameter
        : COMMAND_COLLECT_MODE_FILE stringType
        ;
t_collect_outputformatParameter
        : COMMAND_COLLECT_MODE_OUT_PUT_FORMAT (COMMAND_COLLECT_MODE_OUT_PUT_FORMAT_MODE_RAW | COMMAND_COLLECT_MODE_OUT_PUT_FORMAT_MODE_HEC)
        ;

t_collect_hostParameter
        : COMMAND_COLLECT_MODE_HOST stringType
        ;

t_collect_indexParameter
        : COMMAND_COLLECT_MODE_INDEX stringType
        ;

t_collect_markerParameter
        : COMMAND_COLLECT_MODE_MARKER stringType
        ;

t_collect_run_in_previewParameter
        : COMMAND_COLLECT_MODE_RUN_IN_PREVIEW booleanType
        ;

t_collect_sourceParameter
        : COMMAND_COLLECT_MODE_SOURCE stringType
        ;

t_collect_sourcetypeParameter
        : COMMAND_COLLECT_MODE_SOURCETYPE stringType
        ;

t_collect_spoolParameter
        : COMMAND_COLLECT_MODE_SPOOL booleanType
        ;

t_collect_testmodeParameter
        : COMMAND_COLLECT_MODE_TESTMODE booleanType
        ;

