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
parser grammar DPLParserTransform_predict;

predictTransformation
        : COMMAND_MODE_PREDICT (fieldType (t_predict_fieldRenameInstruction)?)* (t_predict_pdAlgoOptionParameter)? (t_predict_pdCorrelateOptionParameter)? (t_predict_pdFutureTimespanOptionParameter)? (t_predict_pdHoldbackOptionParameter)? (t_predict_pdPeriodOptionParameter)? (t_predict_pdUpperOptionParameter)? (t_predict_pdLowerOptionParameter)? (t_predict_pdSuppressOptionParameter)?
        ;


t_predict_pdAlgoOptionParameter
        : COMMAND_PREDICT_MODE_ALGORITHM (COMMAND_PREDICT_ALGORITHM_MODE_Ll|COMMAND_PREDICT_ALGORITHM_MODE_Llt|COMMAND_PREDICT_ALGORITHM_MODE_Llp|COMMAND_PREDICT_ALGORITHM_MODE_Llp5|COMMAND_PREDICT_ALGORITHM_MODE_Llb|COMMAND_PREDICT_ALGORITHM_MODE_BILL)
        ;


t_predict_pdCorrelateOptionParameter // COMMAND_MODE_PREDICT
        : COMMAND_PREDICT_MODE_CORRELATE fieldType
        ; 


t_predict_pdFutureTimespanOptionParameter
        : COMMAND_PREDICT_MODE_FUTURE_TIMESPAN numberType
        ;


t_predict_pdHoldbackOptionParameter
        : COMMAND_PREDICT_MODE_HOLDBACK numberType
        ;


t_predict_pdLowerOptionParameter
        : COMMAND_PREDICT_MODE_LOWER integerType COMMAND_PREDICT_MODE_END fieldType
        ;


t_predict_pdPeriodOptionParameter
        : COMMAND_PREDICT_MODE_PERIOD numberType
        ;


t_predict_pdSuppressOptionParameter
        : COMMAND_PREDICT_MODE_SUPPRESS fieldType
        ;


t_predict_pdUpperOptionParameter
        : COMMAND_PREDICT_MODE_UPPER integerType COMMAND_PREDICT_MODE_END fieldType
        ;

t_predict_fieldRenameInstruction
        : COMMAND_PREDICT_MODE_AS fieldType
        ;
