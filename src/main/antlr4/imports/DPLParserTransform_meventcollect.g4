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
parser grammar DPLParserTransform_meventcollect;

meventcollectTransformation
        : COMMAND_MODE_MEVENTCOLLECT (t_meventcollect_indexParameter)? (t_meventcollect_fileParameter)? (t_meventcollect_splitParameter)? (t_meventcollect_spoolParameter)? (t_meventcollect_prefixFieldParameter)? (t_meventcollect_hostParameter)? (t_meventsource_sourceParameter)? (t_meventcollect_sourcetypeParameter)? (fieldListType)?
        ;


t_meventcollect_fileParameter
        : COMMAND_MEVENTCOLLECT_MODE_PREFIX_FILE stringType
        ;
t_meventcollect_hostParameter
        : COMMAND_MEVENTCOLLECT_MODE_HOST stringType
        ;

t_meventcollect_indexParameter
        : COMMAND_MEVENTCOLLECT_MODE_INDEX stringType
        ;

t_meventcollect_prefixFieldParameter
        : COMMAND_MEVENTCOLLECT_MODE_PREFIX_FIELD stringType
        ;

t_meventsource_sourceParameter
        : COMMAND_MEVENTCOLLECT_MODE_SOURCE stringType
        ;

t_meventcollect_sourcetypeParameter
        : COMMAND_MEVENTCOLLECT_MODE_SOURCETYPE stringType
        ;

t_meventcollect_splitParameter
        : COMMAND_MEVENTCOLLECT_MODE_SPLIT booleanType
        ;

t_meventcollect_spoolParameter
        : COMMAND_MEVENTCOLLECT_MODE_SPOOL booleanType
        ;

