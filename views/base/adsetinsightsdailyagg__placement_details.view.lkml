view: adsetinsightsdailyagg__placement_details {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.AdsetInsightsDailyAgg` ;;

  dimension: adset_insights_daily_agg__placement_details {
    type: string
    hidden: yes
    sql: adset_insights_daily_agg__placement_details ;;
  }
  dimension: video_view {
    type: number
    sql: ${TABLE}.video_view ;;
  }
  dimension: video_p95_watched_actions_video_views {
    type: number
    sql: ${TABLE}.video_p95_watched_actions_video_views ;;
  }
  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }
  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
  }
  dimension: publisher_platform {
    type: string
    sql: publisher_platform ;;
  }
}
