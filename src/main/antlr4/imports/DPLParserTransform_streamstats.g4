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
parser grammar DPLParserTransform_streamstats;

streamstatsTransformation
        : COMMAND_MODE_STREAMSTATS (t_streamstats_resetOnChangeParameter)? (t_streamstats_resetBeforeParameter)? (t_streamstats_resetAfterParameter)? (t_streamstats_currentParameter)? (t_streamstats_windowParameter)? (t_streamstats_timeWindowParameter)? (t_streamstats_globalParameter)? (t_streamstats_allnumParameter)? (t_streamstats_aggregationInstruction)* (t_streamstats_byInstruction)?
        ;


t_streamstats_allnumParameter
        : COMMAND_STREAMSTATS_MODE_ALLNUM booleanType
        ;


t_streamstats_currentParameter
        : COMMAND_STREAMSTATS_MODE_CURRENT booleanType
        ;


t_streamstats_globalParameter
        : COMMAND_STREAMSTATS_MODE_GLOBAL booleanType
        ;


t_streamstats_resetAfterParameter
        : (COMMAND_STREAMSTATS_MODE_RESET_AFTER | COMMAND_STREAMSTATS_MODE_RESET_AFTER_Q)  evalStatement (EVAL_LANGUAGE_MODE_PARENTHESIS_R | EVAL_LANGUAGE_MODE_PARENTHESIS_R_Q)
        ;


t_streamstats_resetBeforeParameter
        : (COMMAND_STREAMSTATS_MODE_RESET_BEFORE | COMMAND_STREAMSTATS_MODE_RESET_BEFORE_Q) evalStatement (EVAL_LANGUAGE_MODE_PARENTHESIS_R | EVAL_LANGUAGE_MODE_PARENTHESIS_R_Q)
        ;


t_streamstats_resetOnChangeParameter
        : COMMAND_STREAMSTATS_MODE_RESET_ON_CHANGE booleanType
        ;


t_streamstats_timeWindowParameter
        : COMMAND_STREAMSTATS_MODE_TIME_WINDOW spanType
        ;


t_streamstats_windowParameter
        : COMMAND_STREAMSTATS_MODE_WINDOW integerType
        ;

t_streamstats_byInstruction
        : (COMMAND_STREAMSTATS_MODE_BY) fieldListType
        ;

t_streamstats_fieldRenameInstruction
        : (COMMAND_STREAMSTATS_MODE_AS) fieldType
        ;

t_streamstats_aggregationInstruction
        : aggregateFunction (t_streamstats_fieldRenameInstruction)?
        ;
