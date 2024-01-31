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

  measure: cpm_adset_average{
    type: average
    label: "CPM Average Adset"
    value_format_name: usd
    sql: ${TABLE}.cpm ;;
  }

  measure: ctr_adset_average{
    type: average
    label: "CTR Average Adset"
    value_format:"0.00\%"
    sql: ${TABLE}.ctr ;;
  }

  measure: engagement_rate_adset_average{
    type: average
    label: "ER Average Adset"
    value_format:"0.00\%"
    sql: ${TABLE}.engagement_rate ;;
  }

  measure: cvr_adset_average{
    type: average
    label: "CVR Average Adset"
    value_format:"0.00\%"
    sql: ${TABLE}.cvr ;;
  }

  measure: cpcv_adset_average{
    type: average
    label: "CPCV Average Adset"
    value_format_name: usd
    sql: ${TABLE}.cpcv ;;
  }

}
