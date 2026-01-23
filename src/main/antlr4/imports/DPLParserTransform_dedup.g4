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
parser grammar DPLParserTransform_dedup;

dedupTransformation
        : COMMAND_MODE_DEDUP t_dedup_numberParameter? t_dedup_fieldListParameter? (t_dedup_keepeventsParameter|t_dedup_keepemptyParameter|t_dedup_consecutiveParameter)*? (t_dedup_sortbyInstruction)?
        ;

t_dedup_numberParameter
        : COMMAND_DEDUP_INTEGER
        ;

t_dedup_fieldListParameter
        : fieldType (COMMA? fieldType)*?
        ;

t_dedup_consecutiveParameter
        : COMMAND_DEDUP_MODE_CONSECUTIVE booleanType
        ;

t_dedup_keepemptyParameter
        : COMMAND_DEDUP_MODE_KEEPEMPTY booleanType
        ;

t_dedup_keepeventsParameter
        : COMMAND_DEDUP_MODE_KEEPEVENTS booleanType
        ;
t_dedup_sortbyInstruction
        : COMMAND_DEDUP_MODE_SORTBY t_dedup_sortOrder? (fieldType|t_dedup_sortbyMethodAuto|t_dedup_sortbyMethodStr|t_dedup_sortbyMethodIp|t_dedup_sortbyMethodNum) ((COMMA)? ((COMMAND_DEDUP_MODE_PLUS|COMMAND_DEDUP_MODE_MINUS)? (fieldType|t_dedup_sortbyMethodAuto|t_dedup_sortbyMethodStr|t_dedup_sortbyMethodIp|t_dedup_sortbyMethodNum)))*
        ;

t_dedup_sortOrder
        : COMMAND_DEDUP_MODE_PLUS
        | COMMAND_DEDUP_MODE_MINUS
        ;

t_dedup_sortbyMethodAuto
        : COMMAND_DEDUP_MODE_AUTO COMMAND_DEDUP_MODE_PARENTHESIS_L fieldType COMMAND_DEDUP_MODE_PARENTHESIS_R
        ;

t_dedup_sortbyMethodStr
        : COMMAND_DEDUP_MODE_STR COMMAND_DEDUP_MODE_PARENTHESIS_L fieldType COMMAND_DEDUP_MODE_PARENTHESIS_R
        ;

t_dedup_sortbyMethodIp
        : COMMAND_DEDUP_MODE_IP COMMAND_DEDUP_MODE_PARENTHESIS_L fieldType COMMAND_DEDUP_MODE_PARENTHESIS_R
        ;

t_dedup_sortbyMethodNum
        : COMMAND_DEDUP_MODE_NUM COMMAND_DEDUP_MODE_PARENTHESIS_L fieldType COMMAND_DEDUP_MODE_PARENTHESIS_R
        ;


