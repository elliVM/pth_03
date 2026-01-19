/*
 * Teragrep Data Processing Language Parser Library PTH-03
 * Copyright (C) 2019, 2020, 2021, 2022  Suomen Kanuuna Oy
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
// -*- mode: conf; -*-

parser grammar DPLParserProcess;

import DPLParserAggregations,
       DPLParserEvals,
       DPLParserTransform_abstract,
       DPLParserTransform_accum,
       DPLParserTransform_addcoltotals,
       DPLParserTransform_addinfo,
       DPLParserTransform_addtotals,
       DPLParserTransform_analyzefields,
       DPLParserTransform_anomalies,
       DPLParserTransform_anomalousvalue,
       DPLParserTransform_anomalydetection,
       DPLParserTransform_appendcols,
       DPLParserTransform_append,
       DPLParserTransform_appendpipe,
       DPLParserTransform_arules,
       DPLParserTransform_associate,
       DPLParserTransform_audit,
       DPLParserTransform_autoregress,
       DPLParserTransform_bin,
       DPLParserTransform_bucketdir,
       DPLParserTransform_chart,
       DPLParserTransform_cluster,
       DPLParserTransform_cofilter,
       DPLParserTransform_collapse,
       DPLParserTransform_collect,
       DPLParserTransform_concurrency,
       DPLParserTransform_contingency,
       DPLParserTransform_convert,
       DPLParserTransform_correlate,
       DPLParserTransform_datamodel,
       DPLParserTransform_dbinspect,
       DPLParserTransform_dedup,
       DPLParserTransform_delete,
       DPLParserTransform_delta,
       DPLParserTransform_diff,
       DPLParserTransform_dpl,
       DPLParserTransform_dump,
       DPLParserTransform_erex,
       DPLParserTransform_eval,
       DPLParserTransform_eventcount,
       DPLParserTransform_eventstats,
       DPLParserTransform_explain,
       DPLParserTransform_extract,
       DPLParserTransform_fieldformat,
       DPLParserTransform_fields,
       DPLParserTransform_fieldsummary,
       DPLParserTransform_filldown,
       DPLParserTransform_fillnull,
       DPLParserTransform_findkeywords,
       DPLParserTransform_findtypes,
       DPLParserTransform_folderize,
       DPLParserTransform_foreach,
       DPLParserTransform_format,
       DPLParserTransform_from,
       DPLParserTransform_gauge,
       DPLParserTransform_gentimes,
       DPLParserTransform_geomfilter,
       DPLParserTransform_geom,
       DPLParserTransform_geostats,
       DPLParserTransform_head,
       DPLParserTransform_highlight,
       DPLParserTransform_history,
       DPLParserTransform_iconify,
       DPLParserTransform_inputcsv,
       DPLParserTransform_inputlookup,
       DPLParserTransform_iplocation,
       DPLParserTransform_join,
       DPLParserTransform_kmeans,
       DPLParserTransform_kvform,
       DPLParserTransform_loadjob,
       DPLParserTransform_localize,
       DPLParserTransform_localop,
       DPLParserTransform_lookup,
       DPLParserTransform_makecontinuous,
       DPLParserTransform_makejson,
       DPLParserTransform_makemv,
       DPLParserTransform_makeresults,
       DPLParserTransform_map,
       DPLParserTransform_mcatalog,
       DPLParserTransform_mcollect,
       DPLParserTransform_metadata,
       DPLParserTransform_metasearch,
       DPLParserTransform_meventcollect,
       DPLParserTransform_mstats,
       DPLParserTransform_multikv,
       DPLParserTransform_multisearch,
       DPLParserTransform_mvcombine,
       DPLParserTransform_mvexpand,
       DPLParserTransform_nomv,
       DPLParserTransform_outlier,
       DPLParserTransform_outputcsv,
       DPLParserTransform_outputlookup,
       DPLParserTransform_outputtext,
       DPLParserTransform_overlap,
       DPLParserTransform_pivot,
       DPLParserTransform_predict,
       DPLParserTransform_rangemap,
       DPLParserTransform_rare,
       DPLParserTransform_redistribute,
       DPLParserTransform_regex,
       DPLParserTransform_relevancy,
       DPLParserTransform_reltime,
       DPLParserTransform_rename,
       DPLParserTransform_replace,
       DPLParserTransform_rest,
       DPLParserTransform_return,
       DPLParserTransform_reverse,
       DPLParserTransform_rex4j,
       DPLParserTransform_rex,
       DPLParserTransform_rtorder,
       DPLParserTransform_runshellscript,
       DPLParserTransform_savedsearch,
       DPLParserTransform_script,
       DPLParserTransform_scrub,
       DPLParserTransform_search,
       DPLParserTransform_searchtxn,
       DPLParserTransform_selfjoin,
       DPLParserTransform_sendalert,
       DPLParserTransform_sendemail,
       DPLParserTransform_setfields,
       DPLParserTransform_set,
       DPLParserTransform_sichart,
       DPLParserTransform_sirare,
       DPLParserTransform_sistats,
       DPLParserTransform_sitimechart,
       DPLParserTransform_sitop,
       DPLParserTransform_sort,
       DPLParserTransform_spath,
       DPLParserTransform_stats,
       DPLParserTransform_strcat,
       DPLParserTransform_streamstats,
       DPLParserTransform_table,
       DPLParserTransform_tags,
       DPLParserTransform_tail,
       DPLParserTransform_teragrep,
       DPLParserTransform_timechart,
       DPLParserTransform_timewrap,
       DPLParserTransform_top,
       DPLParserTransform_transaction,
       DPLParserTransform_transpose,
       DPLParserTransform_trendline,
       DPLParserTransform_tscollect,
       DPLParserTransform_tstats,
       DPLParserTransform_typeahead,
       DPLParserTransform_typelearner,
       DPLParserTransform_typer,
       DPLParserTransform_union,
       DPLParserTransform_uniq,
       DPLParserTransform_untable,
       DPLParserTransform_where,
       DPLParserTransform_x11,
       DPLParserTransform_xmlkv,
       DPLParserTransform_xmlunescape,
       DPLParserTransform_xpath,
       DPLParserTransform_xyseries;

// statements

transformStatement
	: abstractTransformation (PIPE transformStatement)?
        | accumTransformation (PIPE transformStatement)?
        | addcoltotalsTransformation (PIPE transformStatement)?
        | addinfoTransformation (PIPE transformStatement)?
        | addtotalsTransformation (PIPE transformStatement)?
        | analyzefieldsTransformation (PIPE transformStatement)?
        | anomaliesTransformation (PIPE transformStatement)?
        | anomalousvalueTransformation (PIPE transformStatement)?
        | anomalydetectionTransformation (PIPE transformStatement)?
        | appendTransformation (PIPE transformStatement)?
        | appendcolsTransformation (PIPE transformStatement)?
        | appendpipeTransformation (PIPE transformStatement)?
        | arulesTransformation (PIPE transformStatement)?
        | associateTransformation (PIPE transformStatement)?
        | auditTransformation (PIPE transformStatement)?
        | autoregressTransformation (PIPE transformStatement)?
        | binTransformation (PIPE transformStatement)?
        | bucketdirTransformation (PIPE transformStatement)?
        | chartTransformation (PIPE transformStatement)?
        | clusterTransformation (PIPE transformStatement)?
        | cofilterTransformation (PIPE transformStatement)?
        | collapseTransformation (PIPE transformStatement)?
        | collectTransformation (PIPE transformStatement)?
        | concurrencyTransformation (PIPE transformStatement)?
        | contingencyTransformation (PIPE transformStatement)?
        | convertTransformation (PIPE transformStatement)?
        | correlateTransformation (PIPE transformStatement)?
        | datamodelTransformation (PIPE transformStatement)?
        | dbinspectTransformation (PIPE transformStatement)?
        | dedupTransformation (PIPE transformStatement)?
        | deleteTransformation (PIPE transformStatement)?
        | deltaTransformation (PIPE transformStatement)?
        | diffTransformation (PIPE transformStatement)?
	| dplTransformation (PIPE transformStatement)?
        | dumpTransformation (PIPE transformStatement)?
        | erexTransformation (PIPE transformStatement)?
        | evalTransformation (PIPE transformStatement)?
        | eventcountTransformation (PIPE transformStatement)?
        | eventstatsTransformation (PIPE transformStatement)?
	| explainTransformation (PIPE transformStatement)?
        | extractTransformation (PIPE transformStatement)?
        | fieldformatTransformation (PIPE transformStatement)?
        | fieldsTransformation (PIPE transformStatement)?
        | fieldsummaryTransformation (PIPE transformStatement)?
        | filldownTransformation (PIPE transformStatement)?
        | fillnullTransformation (PIPE transformStatement)?
        | findkeywordsTransformation (PIPE transformStatement)?
        | findtypesTransformation (PIPE transformStatement)?
        | folderizeTransformation (PIPE transformStatement)?
        | foreachTransformation (PIPE transformStatement)?
        | formatTransformation (PIPE transformStatement)?
        | fromTransformation (PIPE transformStatement)?
        | gaugeTransformation (PIPE transformStatement)?
        | gentimesTransformation (PIPE transformStatement)?
        | geomTransformation (PIPE transformStatement)?
        | geomfilterTransformation (PIPE transformStatement)?
        | geostatsTransformation (PIPE transformStatement)?
        | headTransformation (PIPE transformStatement)?
        | highlightTransformation (PIPE transformStatement)?
        | historyTransformation (PIPE transformStatement)?
        | iconifyTransformation (PIPE transformStatement)?
        | inputcsvTransformation (PIPE transformStatement)?
        | inputlookupTransformation (PIPE transformStatement)?
        | iplocationTransformation (PIPE transformStatement)?
        | joinTransformation (PIPE transformStatement)?
        | kmeansTransformation (PIPE transformStatement)?
        | kvformTransformation (PIPE transformStatement)?
        | loadjobTransformation (PIPE transformStatement)?
        | localizeTransformation (PIPE transformStatement)?
        | localopTransformation (PIPE transformStatement)?
        | lookupTransformation (PIPE transformStatement)?
        | makecontinuousTransformation (PIPE transformStatement)?
        | makejsonTransformation (PIPE transformStatement)?
        | makemvTransformation (PIPE transformStatement)?
        | makeresultsTransformation (PIPE transformStatement)?
        | mapTransformation (PIPE transformStatement)?
        | mcatalogTransformation (PIPE transformStatement)?
        | mcollectTransformation (PIPE transformStatement)?
        | metadataTransformation (PIPE transformStatement)?
        | metasearchTransformation (PIPE transformStatement)?
        | meventcollectTransformation (PIPE transformStatement)?
        | mstatsTransformation (PIPE transformStatement)?
        | multikvTransformation (PIPE transformStatement)?
        | multisearchTransformation (PIPE transformStatement)?
        | mvcombineTransformation (PIPE transformStatement)?
        | mvexpandTransformation (PIPE transformStatement)?
        | nomvTransformation (PIPE transformStatement)?
        | outlierTransformation (PIPE transformStatement)?
        | outputcsvTransformation (PIPE transformStatement)?
        | outputlookupTransformation (PIPE transformStatement)?
        | outputtextTransformation (PIPE transformStatement)?
        | overlapTransformation (PIPE transformStatement)?
        | pivotTransformation (PIPE transformStatement)?
        | predictTransformation (PIPE transformStatement)?
        | rangemapTransformation (PIPE transformStatement)?
        | rareTransformation (PIPE transformStatement)?
        | redistributeTransformation (PIPE transformStatement)?
        | regexTransformation (PIPE transformStatement)?
        | relevancyTransformation (PIPE transformStatement)?
        | reltimeTransformation (PIPE transformStatement)?
        | renameTransformation (PIPE transformStatement)?
        | replaceTransformation (PIPE transformStatement)?
        | restTransformation (PIPE transformStatement)?
        | returnTransformation (PIPE transformStatement)?
        | reverseTransformation (PIPE transformStatement)?
	| rex4jTransformation (PIPE transformStatement)?
        | rexTransformation (PIPE transformStatement)?
        | rtorderTransformation (PIPE transformStatement)?
        | runshellscriptTransformation (PIPE transformStatement)?
        | savedsearchTransformation (PIPE transformStatement)?
        | scriptTransformation (PIPE transformStatement)?
        | scrubTransformation (PIPE transformStatement)?
        | searchTransformation (PIPE transformStatement)?
        | searchtxnTransformation (PIPE transformStatement)?
        | selfjoinTransformation (PIPE transformStatement)?
        | sendalertTransformation (PIPE transformStatement)?
        | sendemailTransformation (PIPE transformStatement)?
        | setTransformation (PIPE transformStatement)?
        | setfieldsTransformation (PIPE transformStatement)?
        | sichartTransformation (PIPE transformStatement)?
        | sirareTransformation (PIPE transformStatement)?
        | sistatsTransformation (PIPE transformStatement)?
        | sitimechartTransformation (PIPE transformStatement)?
        | sitopTransformation (PIPE transformStatement)?
        | sortTransformation (PIPE transformStatement)?
        | spathTransformation (PIPE transformStatement)?
        | statsTransformation (PIPE transformStatement)?
        | strcatTransformation (PIPE transformStatement)?
        | streamstatsTransformation (PIPE transformStatement)?
        | tableTransformation (PIPE transformStatement)?
        | tagsTransformation (PIPE transformStatement)?
        | tailTransformation (PIPE transformStatement)?
	| teragrepTransformation (PIPE transformStatement)?
        | timechartTransformation (PIPE transformStatement)?
        | timewrapTransformation (PIPE transformStatement)?
        | topTransformation (PIPE transformStatement)?
        | transactionTransformation (PIPE transformStatement)?
        | transposeTransformation (PIPE transformStatement)?
        | trendlineTransformation (PIPE transformStatement)?
        | tscollectTransformation (PIPE transformStatement)?
        | tstatsTransformation (PIPE transformStatement)?
        | typeaheadTransformation (PIPE transformStatement)?
        | typelearnerTransformation (PIPE transformStatement)?
        | typerTransformation (PIPE transformStatement)?
        | unionTransformation (PIPE transformStatement)?
        | uniqTransformation (PIPE transformStatement)?
        | untableTransformation (PIPE transformStatement)?
        | whereTransformation (PIPE transformStatement)?
        | x11Transformation (PIPE transformStatement)?
        | xmlkvTransformation (PIPE transformStatement)?
        | xmlunescapeTransformation (PIPE transformStatement)?
        | xpathTransformation (PIPE transformStatement)?
        | xyseriesTransformation (PIPE transformStatement)?
        | EOF
        ;



