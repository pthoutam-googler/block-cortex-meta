view: adsetinsightsdailyagg {
  derived_table: {
    sql: SELECT
        targeting_details.audience_subtype,
        ad.campaign_id,
        ad.report_date,
        ad.account_id
      FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg` ad
      LEFT JOIN UNNEST(targeting_details) as targeting_details;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: report_date {
    type: date
    sql: ${TABLE}.report_date ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: audience_subtype {
    type: string
    sql: ${TABLE}.audience_subtype ;;
  }

}
