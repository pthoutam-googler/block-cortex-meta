view: adsetinsightsdailyagg__placement_details {

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
  dimension: platform {
    type: string
    sql: publisher_platform ;;
  }
  dimension: offset {
    type: number
    hidden: yes
    sql: adsetinsightsdailyagg__placement_details_offset;;
  }
}
