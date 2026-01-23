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
parser grammar DPLParserTransform_contingency;

contingencyTransformation
        : COMMAND_MODE_CONTINGENCY t_contingency_contingencyOptionsParameter*? fieldType fieldType
        ;

t_contingency_contingencyOptionsParameter
        : (t_contingency_maxcolsParameter|t_contingency_maxrowsParameter)
        | (t_contingency_mincolcoverParameter | t_contingency_minrowcoverParameter)
        | t_contingency_usetotalParameter
        | t_contingency_totalstrParameter
        ;

t_contingency_maxcolsParameter
        : COMMAND_CONTINGENCY_MODE_MAXCOLS integerType
        ;


t_contingency_maxrowsParameter
        : COMMAND_CONTINGENCY_MODE_MAXROWS integerType
        ;


t_contingency_mincolcoverParameter
        : COMMAND_CONTINGENCY_MODE_MINCOLCOVER numberType
        ;


t_contingency_minrowcoverParameter
        : COMMAND_CONTINGENCY_MODE_MINROWCOVER numberType
        ;


t_contingency_totalstrParameter
        : COMMAND_CONTINGENCY_MODE_TOTALSTR fieldType
        ;


t_contingency_usetotalParameter
        : COMMAND_CONTINGENCY_MODE_USETOTAL booleanType
        ;

