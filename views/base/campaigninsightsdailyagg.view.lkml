view: campaigninsightsdailyagg {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.CampaignInsightsDailyAgg` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.report_date ;;
  }
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }
  dimension: total_video_view {
    type: number
    sql: ${TABLE}.video_view ;;
  }
  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
  }
  dimension: post_engagement {
    type: number
    sql: ${TABLE}.post_engagement ;;
  }
  dimension: total_clicks {
    type: number
    sql: ${TABLE}.link_clicks ;;
  }
  dimension: total_reach {
    type: number
    sql: ${TABLE}.total_reach ;;
  }
  dimension: campaign_start_date {
    type: date
    sql: ${TABLE}.campaign_start_time;;
  }
  dimension: campaign_stop_date {
    type: date
    sql: ${TABLE}.campaign_stop_time ;;
  }
  dimension: placement_details {
    hidden: yes
    sql: ${TABLE}.placement_details ;;
  }
  dimension: shares {
    type: number
    sql: ${TABLE}.post_shares ;;
  }
  dimension: reactions {
    type: number
    sql: ${TABLE}.post_reaction ;;
  }
  dimension: saves {
    type: number
    sql: ${TABLE}.post_save ;;
  }
  dimension: comments {
    type: number
    sql: ${TABLE}.post_comments ;;
  }
  dimension: page_likes {
    type: number
    sql: ${TABLE}.page_like ;;
  }
  dimension: video_p95_watched_actions_video_views {
    type: number
    sql: ${TABLE}.video_p95_watched_actions_video_views ;;
  }
  dimension: link_clicks {
    type: number
    sql: ${TABLE}.link_clicks ;;
  }
  #dimension: placement {
   # type: string
   # sql: ${TABLE}.placement_details.placement ;;
  #}
}
