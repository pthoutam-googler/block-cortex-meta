view: adsetinsightsdailyagg {
  derived_table: {
    sql: SELECT
        targeting_audiences.subtype,
        ad.campaign_id,
        ad.report_date,
        ad.account_id
      FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg` ad
      LEFT JOIN UNNEST(targeting_audiences) as targeting_audiences;;
  }

  dimension: campaign_id {
    type: number
    description: "Id of campaigns"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: report_date {
    type: date
    description: "API data extraction date to be used for Reporting Use cases"
    sql: ${TABLE}.report_date ;;
  }

  dimension: account_id {
    type: number
    description: "The ID number of your ad account, which groups your advertising activity"
    sql: ${TABLE}.account_id ;;
  }

  dimension: subtype {
    type: string
    description: "Audience which we know"
    sql: ${TABLE}.subtype ;;
  }

}
