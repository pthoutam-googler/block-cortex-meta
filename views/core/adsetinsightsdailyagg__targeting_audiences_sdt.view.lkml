view: adsetinsightsdailyagg__targeting_audiences_sdt {
  derived_table: {
    sql: select distinct
               adset_id,
               STRING_AGG(distinct targeting_audiences.name, " + ") as adset_audience
         from `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg` ad
         left join UNNEST(targeting_audiences) as targeting_audiences
         group by adset_id
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
