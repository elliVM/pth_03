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
parser grammar DPLParserTransform_sendemail;

sendemailTransformation
        : COMMAND_MODE_SENDEMAIL (t_sendemail_toOptionParameter
        | t_sendemail_fromOptionParameter
        | t_sendemail_bccOptionParameter
        | t_sendemail_ccOptionParameter
        | t_sendemail_contentTypeOptionParameter
        | t_sendemail_footerOptionParameter
        | t_sendemail_formatOptionParameter
        | t_sendemail_gracefulParameter
        | t_sendemail_inlineOptionParameter
        | t_sendemail_maxinputsParameter
        | t_sendemail_maxtimeParameter
        | t_sendemail_messageOptionParameter
        | t_sendemail_paperorientationOptionParameter
        | t_sendemail_papersizeOptionParameter
        | t_sendemail_pdfviewOptionParameter
        | t_sendemail_priorityOptionParameter
        | t_sendemail_sendcsvOptionParameter
        | t_sendemail_sendpdfOptionParameter
        | t_sendemail_sendresultsOptionParameter
        | t_sendemail_serverOptionParameter
        | t_sendemail_subjectOptionParameter
        | t_sendemail_useSslOptionParameter
        | t_sendemail_useTlsOptionParameter
        | t_sendemail_widthSortColumnsOptionParameter)*?
        ;


t_sendemail_bccOptionParameter
        : COMMAND_SENDEMAIL_MODE_BCC t_sendemail_emailListParameter
        ;


t_sendemail_ccOptionParameter
        : COMMAND_SENDEMAIL_MODE_CC t_sendemail_emailListParameter
        ;


t_sendemail_contentTypeOptionParameter
        : COMMAND_SENDEMAIL_MODE_CONTENT_TYPE (COMMAND_SENDEMAIL_MODE_CONTENT_TYPE_MODE_HTML|COMMAND_SENDEMAIL_MODE_CONTENT_TYPE_MODE_PLAIN)
        ;


t_sendemail_footerOptionParameter
        : COMMAND_SENDEMAIL_MODE_FOOTER stringType
        ;

t_sendemail_formatOptionParameter
        : COMMAND_SENDEMAIL_MODE_FORMAT (COMMAND_SENDEMAIL_MODE_FORMAT_MODE_CSV|COMMAND_SENDEMAIL_MODE_FORMAT_MODE_TABLE|COMMAND_SENDEMAIL_MODE_FORMAT_MODE_RAW)
        ;

t_sendemail_fromOptionParameter // COMMAND_MODE_SENDEMAIL
        : COMMAND_SENDEMAIL_MODE_FROM t_sendemail_emailListParameter
        ;


t_sendemail_gracefulParameter
        : COMMAND_SENDEMAIL_MODE_GRACEFUL booleanType
        ;


t_sendemail_inlineOptionParameter
        : COMMAND_SENDEMAIL_MODE_INLINE booleanType
        ;


t_sendemail_maxinputsParameter
        : COMMAND_SENDEMAIL_MODE_MAXINPUTS integerType
        ;


t_sendemail_maxtimeParameter
        : COMMAND_SENDEMAIL_MODE_MAXTIME timeType
        ;


t_sendemail_messageOptionParameter
        : COMMAND_SENDEMAIL_MODE_MESSAGE stringType
        ;


t_sendemail_paperorientationOptionParameter
        : COMMAND_SENDEMAIL_MODE_PAPERORIENTATION (COMMAND_SENDEMAIL_MODE_PAPERORIENTATION_MODE_PORTRAIT|COMMAND_SENDEMAIL_MODE_PAPERORIENTATION_MODE_LANDSCAPE)
        ; 


t_sendemail_papersizeOptionParameter
        : COMMAND_SENDEMAIL_MODE_PAPERSIZE (COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_LETTER|COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_LEGAL|COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_LEDGER|COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A2|COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A3|COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A4|COMMAND_SENDEMAIL_MODE_PAPERSIZE_MODE_A5)
        ;


t_sendemail_pdfviewOptionParameter
        : COMMAND_SENDEMAIL_MODE_PDFVIEW stringType
        ;


t_sendemail_priorityOptionParameter
        : COMMAND_SENDEMAIL_MODE_PRIORITY (COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_HIGHEST|COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_HIGH|COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_NORMAL|COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_LOW|COMMAND_SENDEMAIL_MODE_PRIORITY_MODE_LOWEST)
        ;

t_sendemail_sendcsvOptionParameter
        : COMMAND_SENDEMAIL_MODE_SENDCSV booleanType
        ;


t_sendemail_sendpdfOptionParameter
        : COMMAND_SENDEMAIL_MODE_SENDPDF booleanType
        ;


t_sendemail_sendresultsOptionParameter
        : COMMAND_SENDEMAIL_MODE_SENDRESULTS booleanType
        ;


t_sendemail_serverOptionParameter
        : COMMAND_SENDEMAIL_MODE_SERVER stringType
        ;

t_sendemail_subjectOptionParameter
        : COMMAND_SENDEMAIL_MODE_SUBJECT stringType
        ;


t_sendemail_toOptionParameter
        : COMMAND_SENDEMAIL_MODE_TO t_sendemail_emailListParameter
        ;


t_sendemail_useSslOptionParameter
        : COMMAND_SENDEMAIL_MODE_USE_SSL booleanType
        ;


t_sendemail_useTlsOptionParameter
        : COMMAND_SENDEMAIL_MODE_USE_TLS booleanType
        ;


t_sendemail_widthSortColumnsOptionParameter
        : COMMAND_SENDEMAIL_MODE_WIDTH_SORT_COLUMNS booleanType
        ;

t_sendemail_emailListParameter
        : stringType (COMMA stringType)*?
        ;

