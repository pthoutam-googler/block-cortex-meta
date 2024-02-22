view: adsetinsightsdailyagg {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.AdsetInsightsDailyAgg` ;;

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.report_date ;;
  }
  dimension: adset_id {
    type: number
    hidden: yes
    sql: ${TABLE}.adset_id ;;
  }
  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }
  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
  }
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: post_engagement {
    type: number
    sql: ${TABLE}.post_engagement ;;
  }
  dimension: video_view {
    type: number
    sql: ${TABLE}.video_view ;;
  }
  dimension: link_clicks {
    type: number
    sql: ${TABLE}.link_clicks ;;
  }
  dimension: targeting_audiences {
    hidden: yes
    sql: ${TABLE}.targeting_audiences ;;
  }
  dimension: placement_details {
    hidden: yes
    sql: ${TABLE}.placement_details ;;
  }
  dimension: platform_details {
    hidden: yes
    sql: ${TABLE}.platform_details ;;
  }
}
