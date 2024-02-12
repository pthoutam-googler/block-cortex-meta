include: "/views/base/adsetinsightsdailyagg.view"

view: +adsetinsightsdailyagg {

  dimension: adsetinsightsdailyagg_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.campaign_id, ${TABLE}.account_id, ${TABLE}.report_date) ;;
  }
  measure: sum_of_total_impressions {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your ads were on screen."
    sql: ${total_impressions_adset} ;;
  }
  measure: average_of_cpm{
    type: average
    value_format_name: usd
    description: "The average cost for 1,000 impressions."
    sql: ${cpm} ;;
  }
  measure: average_of_link_ctr{
    type: average
    value_format:"0.00\%"
    description: "The number of clicks that your ad receives divided by the number of times your ad is shown"
    sql: ${link_ctr} ;;
  }
  measure: sum_of_post_engagement {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "Post engagements are the total number of actions that people take involving your ads"
    sql: ${post_engagement_adset} ;;
  }
  measure: average_of_engagement_rate{
    type: average
    value_format:"0.00\%"
    description: "The total engagement divided by total reach."
    sql: ${engagement_rate} ;;
  }
  measure: average_of_cpe{
    type: average
    value_format:"0.00\%"
    description: "Compares the cost to the total amount of engagements on a Facebook post that include: likes and reactions. comments. shares."
    sql: ${cpe} ;;
  }
  measure: sum_of_total_video_view {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your video plays for at least 3 seconds"
    sql: ${total_video_view} ;;
  }
  measure: average_of_vtr{
    type: average
    value_format:"0.00\%"
    description: "The video p95 watched actions divided by impressions."
    sql: ${vtr} ;;
  }
  measure: average_of_cpcv{
    type: average
    value_format_name: usd
    description: "Pay for a video ad once the user watches a video in its entirety"
    sql: ${cpcv} ;;
  }
}
