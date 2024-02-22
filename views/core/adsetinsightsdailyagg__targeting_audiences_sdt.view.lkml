view: adsetinsightsdailyagg__targeting_audiences_sdt {
  derived_table: {
    sql: SELECT DISTINCT
             adset_id,
             adset_name,
             STRING_AGG(DISTINCT targeting_audiences.name, ' + ') AS adset_audience
         FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg`
         LEFT JOIN UNNEST(targeting_audiences) AS targeting_audiences
         GROUP BY
             adset_id,
             adset_name
         ;;

  }
  dimension: adsetinsightsdailyagg__targeting_audiences_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.adset_id, ${TABLE}.adset_name) ;;
  }
  dimension: adset_id {
    type: number
    description: "The unique ID of the ad set you're viewing in reporting. "
    hidden: yes
    sql: ${TABLE}.adset_id ;;
  }
  dimension: adset_name {
    type: string
    description: "The name of the ad set you're viewing in reporting."
    sql: ${TABLE}.adset_name ;;
  }
  dimension: adset_audience {
    type: string
    description: "Names of the audiences or interests."
    sql: ${TABLE}.adset_audience ;;
  }
}
