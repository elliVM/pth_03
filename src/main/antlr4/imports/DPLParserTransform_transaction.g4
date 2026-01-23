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
parser grammar DPLParserTransform_transaction;

transactionTransformation
        : COMMAND_MODE_TRANSACTION (fieldListType)? t_transaction_nameParameter? t_transaction_tnxOptions*? t_transaction_memControlOptions*? t_transaction_multivalueOptions*?
        ;

t_transaction_nameParameter
        : COMMAND_TRANSACTION_MODE_NAME stringType
        ;

t_transaction_tnxOptions
        : t_transaction_connectedParameter
        | t_transaction_endswithParameter
        | t_transaction_keeporphansParameter
        | t_transaction_maxspanParameter
        | t_transaction_lmaxpauseOptParameter
        | t_transaction_maxeventsParameter
        | t_transaction_startOptParameter
        | t_transaction_unifyendsParameter
        ;

t_transaction_memControlOptions
        : t_transaction_maxopentxnOptParameter
        | t_transaction_maxopeneventsOptParameter
        | t_transaction_keepevictedOptParameter
        ;

t_transaction_multivalueOptions
        : t_transaction_delimParameter
        | t_transaction_mvlistParameter
        | t_transaction_mvrawOptParameter
        | t_transaction_nullstrParameter
        ;

t_transaction_connectedParameter
         : COMMAND_TRANSACTION_MODE_CONNECTED booleanType
         ;

t_transaction_delimParameter
        : COMMAND_TRANSACTION_MODE_DELIM stringType
        ;

t_transaction_keepevictedOptParameter
        : COMMAND_TRANSACTION_MODE_KEEPEVICTED booleanType
        ;

t_transaction_keeporphansParameter
        : COMMAND_TRANSACTION_MODE_KEEPORPHANS booleanType
        ;


t_transaction_lmaxpauseOptParameter
        : COMMAND_TRANSACTION_MODE_MAXPAUSE spanType
        ;


t_transaction_maxeventsParameter
        : COMMAND_TRANSACTION_MODE_MAXEVENTS integerType
        ;


t_transaction_maxopeneventsOptParameter
        : COMMAND_TRANSACTION_MODE_MAXOPENEVENTS integerType
        ;


t_transaction_maxopentxnOptParameter
        : COMMAND_TRANSACTION_MODE_MAXOPENTXN integerType
        ;


t_transaction_maxspanParameter
        : COMMAND_TRANSACTION_MODE_MAXSPAN spanType
        ;


t_transaction_mvrawOptParameter
        : COMMAND_TRANSACTION_MODE_MVRAW booleanType
        ;


t_transaction_nullstrParameter
        : COMMAND_TRANSACTION_MODE_NULLSTR stringType
        ;


t_transaction_startOptParameter
        : COMMAND_TRANSACTION_MODE_STARTSWITH  t_transaction_transamFilterStringParameter
        ;

t_transaction_unifyendsParameter
        : COMMAND_TRANSACTION_MODE_UNIFYENDS booleanType
        ;


t_transaction_transamFilterStringParameter // We need to parse them again if they are "string type"
        : stringType
        | COMMAND_TRANSACTION_MODE_SEARCH_HACK_EVAL evalStatement EVAL_LANGUAGE_MODE_PARENTHESIS_R
        ; 


t_transaction_endswithParameter
        : COMMAND_TRANSACTION_MODE_ENDSWITH t_transaction_transamFilterStringParameter
        ;

t_transaction_mvlistParameter
        : COMMAND_TRANSACTION_MODE_MVLIST (booleanType|fieldListType)
        ;




