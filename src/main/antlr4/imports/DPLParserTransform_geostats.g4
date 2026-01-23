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
parser grammar DPLParserTransform_geostats;

geostatsTransformation
        : COMMAND_MODE_GEOSTATS (t_geostats_translateToXyParameter)? (t_geostats_latFieldParameter)? (t_geostats_longFieldParameter)? (t_geostats_outputLatFieldParameter)? (t_geostats_outputLongFieldParameter)? (t_geostats_globalLimitParameter)? (t_geostats_localLimitParameter)? (t_geostats_binSpanLatParameter t_geostats_binSpanLongParameter)? (t_geostats_maxZoomLevelParameter)? (t_geostats_statsAggTermInstruction) (t_geostats_statsAggTermInstruction)*? (t_geostats_byInstruction)?
        ;


t_geostats_binSpanLatParameter
        : COMMAND_GEOSTATS_MODE_BINSPANLAT numberType
        ;

t_geostats_binSpanLongParameter
        : COMMAND_GEOSTATS_MODE_BINSPANLONG numberType
        ;


t_geostats_globalLimitParameter
        : COMMAND_GEOSTATS_MODE_GLOBALLIMIT integerType
        ;


t_geostats_latFieldParameter
        : COMMAND_GEOSTATS_MODE_LATFIELD stringType
        ;


t_geostats_localLimitParameter
        : COMMAND_GEOSTATS_MODE_LOCALLIMIT integerType
        ;

        
t_geostats_longFieldParameter
        : COMMAND_GEOSTATS_MODE_LONGFIELD stringType
        ;

t_geostats_maxZoomLevelParameter
        : COMMAND_GEOSTATS_MODE_MAXZOOMLEVEL integerType
        ;

        
t_geostats_outputLatFieldParameter
        : COMMAND_GEOSTATS_MODE_OUTPUTLATFIELD stringType
        ;

        
t_geostats_outputLongFieldParameter
        : COMMAND_GEOSTATS_MODE_OUTPUTLONGFIELD stringType
        ;


t_geostats_translateToXyParameter
        : COMMAND_GEOSTATS_MODE_TRANSLATETOXY booleanType
        ;

t_geostats_statsAggTermInstruction
        : aggregateFunction ((COMMAND_GEOSTATS_MODE_AS) fieldType)?
        ;

t_geostats_byInstruction
        : (COMMAND_GEOSTATS_MODE_BY) fieldListType
        ;


