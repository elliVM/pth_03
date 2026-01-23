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
parser grammar DPLParserTransform_extract;

extractTransformation
        : COMMAND_MODE_EXTRACT (t_extract_clean_keysParameter|t_extract_kvdelimParameter|t_extract_limitParameter|t_extract_maxcharsParameter|t_extract_mv_addParameter|t_extract_pairdelimParameter|t_extract_reloadParameter|t_extract_segmentParameter)* (stringType)*
        ;


t_extract_clean_keysParameter
        : COMMAND_EXTRACT_MODE_CLEAN_KEYS booleanType
        ;

        
t_extract_kvdelimParameter
        : COMMAND_EXTRACT_MODE_KVDELIM stringType
        ;


t_extract_limitParameter
        : COMMAND_EXTRACT_MODE_LIMIT integerType
        ;

        
t_extract_maxcharsParameter
        : COMMAND_EXTRACT_MODE_MAXCHARS integerType
        ;

        
t_extract_mv_addParameter
        : COMMAND_EXTRACT_MODE_MV_ADD booleanType
        ;

        
t_extract_pairdelimParameter
        : COMMAND_EXTRACT_MODE_PAIRDELIM stringType
        ;

        
t_extract_reloadParameter
        : COMMAND_EXTRACT_MODE_RELOAD booleanType
        ;

        
t_extract_segmentParameter
        : COMMAND_EXTRACT_MODE_SEGMENT booleanType
        ;

