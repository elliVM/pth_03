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
parser grammar DPLParserTransform_union;

unionTransformation
        : COMMAND_MODE_UNION (t_union_subsearchParameter)? (t_union_datasetParameter)+
        ;


t_union_datasetParameter
        : ( t_union_namedDatasetParameter | t_union_unnamedDatasetParameter )
        ;


t_union_subsearchParameter
        : COMMAND_UNION_MODE_MAXTIME integerType
        | COMMAND_UNION_MODE_MAXOUT integerType
        | COMMAND_UNION_MODE_TIMEOUT integerType
        ;


t_union_namedDatasetParameter
        : t_union_datasetTypeParameter COMMAND_UNION_MODE_COLON stringType
        ;


t_union_unnamedDatasetParameter
        : subsearchStatement
        ;


t_union_datasetTypeParameter
        : (COMMAND_UNION_MODE_DATAMODEL|COMMAND_UNION_MODE_SAVEDSEARCH|COMMAND_UNION_MODE_INPUTLOOKUP)
        ;

