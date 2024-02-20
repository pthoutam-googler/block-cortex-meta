view: adsetinsightsdailyagg__platform_details {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.AdsetInsightsDailyAgg` ;;

  dimension: adset_insights_daily_agg__platform_details {
    type: string
    hidden: yes
    sql: adset_insights_daily_agg__platform_details ;;
  }
  dimension: post_engagement {
    type: number
    sql: ${TABLE}.post_engagement ;;
  }
  dimension: publisher_platform {
    type: string
    sql: publisher_platform ;;
  }
  dimension: total_reach {
    type: number
    sql: ${TABLE}.total_reach ;;
  }
  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
  }
}
