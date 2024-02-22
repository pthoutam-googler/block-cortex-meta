view: campaigninsightsdailyagg__placement_details {

  dimension: campaigninsightsdailyagg__placement_details {
    type: string
    hidden: yes
    sql: campaign_insights_daily_agg__placement_details ;;
  }
  dimension: placement {
    type: string
    sql: platform_position ;;
  }
  dimension: platform {
    type: string
    sql: publisher_platform ;;
  }
  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }
  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
  }
  dimension: link_clicks {
    type: number
    sql: ${TABLE}.link_clicks ;;
  }
  dimension: video_view {
    type: number
    sql: ${TABLE}.video_view ;;
  }
  dimension: video_p95_watched_actions_video_views {
    type: number
    sql: ${TABLE}.video_p95_watched_actions_video_views ;;
  }
}
