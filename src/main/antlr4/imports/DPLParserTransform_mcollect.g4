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
parser grammar DPLParserTransform_mcollect;

mcollectTransformation
        : COMMAND_MODE_MCOLLECT (t_mcollect_indexParameter) (t_mcollect_fileParameter)? (t_mcollect_splitParameter)? (t_mcollect_spoolParameter)? (t_mcollect_prefixFieldParameter)? (t_mcollect_hostParameter)? (t_mcollect_sourceParameter)? (t_mcollect_sourcetypeParameter)? (t_mcollect_markerParameter)? (fieldListType)?
        ;

t_mcollect_fileParameter
        : COMMAND_MCOLLECT_MODE_FILE stringType
        ;

t_mcollect_hostParameter
        : COMMAND_MCOLLECT_MODE_HOST stringType
        ;

t_mcollect_indexParameter
        : COMMAND_MCOLLECT_MODE_INDEX stringType
        ;
t_mcollect_markerParameter
        : COMMAND_MCOLLECT_MODE_MARKER stringType
        ;

t_mcollect_prefixFieldParameter
        : COMMAND_MCOLLECT_MODE_PREFIX_FIELD stringType
        ;

t_mcollect_sourceParameter
        : COMMAND_MCOLLECT_MODE_SOURCE stringType
        ;

t_mcollect_sourcetypeParameter
        : COMMAND_MCOLLECT_MODE_SOURCETYPE stringType
        ;

t_mcollect_splitParameter
        : COMMAND_MCOLLECT_MODE_SPLIT booleanType
        ;

t_mcollect_spoolParameter
        : COMMAND_MCOLLECT_MODE_SPOOL booleanType
        ;

