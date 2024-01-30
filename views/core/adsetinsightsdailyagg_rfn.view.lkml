include: "/views/base/adsetinsightsdailyagg.view"

view: +adsetinsightsdailyagg {

  measure: total_video_p95_watched_actions_video_views {
    type: sum
    label: "Total Video_p95 Adset"
    value_format_name: "positive_m_or_k"
    sql: ${TABLE}.video_p95_watched_actions_video_views ;;
  }

  measure: total_impressions_adset_sum {
    type: sum
    label: "Total Impressions Adset"
    value_format_name: "positive_m_or_k"
    sql: ${TABLE}.total_impressions ;;
  }

  measure: total_engagement_adset_sum {
    type: sum
    label: "Total Engagement Adset"
    value_format_name: "positive_m_or_k"
    sql: ${TABLE}.total_engagement ;;
  }

}
