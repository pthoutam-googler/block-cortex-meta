view: adsetinsightsdailyagg__targeting_audiences_sdt {
  derived_table: {
    sql: SELECT DISTINCT
               adset_id,
               STRING_AGG(DISTINCT targeting_audiences.name, ' + ') AS adset_audience
         FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg`
         LEFT JOIN UNNEST(targeting_audiences) AS targeting_audiences
         GROUP BY adset_id
         ;;

  }
  dimension: adset_id {
    type: number
    hidden: yes
    sql: ${TABLE}.adset_id ;;
  }
  dimension: adset_audience {
    type: string
    description: "Names of the audiences or interests"
    sql: ${TABLE}.adset_audience ;;
  }
}
