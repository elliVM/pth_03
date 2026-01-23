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
parser grammar DPLParserTransform_bin;

binTransformation
        : COMMAND_MODE_BIN (t_bin_binsParameter|t_bin_minspanParameter|t_bin_spanParameter|t_bin_startParameter|t_bin_endParameter|t_bin_alignTimeParameter)*? (t_bin_fieldRenameInstruction)
        ;


t_bin_alignTimeParameter
        : COMMAND_BIN_MODE_ALIGNTIME (timeType)
        ;


t_bin_binsParameter
        : COMMAND_BIN_MODE_BINS integerType
        ;


t_bin_endParameter
        : COMMAND_BIN_MODE_END numberType
        ;


t_bin_minspanParameter
        : COMMAND_BIN_MODE_MINSPAN spanType
        ;

t_bin_spanParameter
        : COMMAND_BIN_MODE_SPAN spanType
        ;


t_bin_startParameter
        : COMMAND_BIN_MODE_START numberType
        ;


t_bin_fieldRenameInstruction
        : fieldType (COMMAND_BIN_MODE_AS fieldType)?
        ;
