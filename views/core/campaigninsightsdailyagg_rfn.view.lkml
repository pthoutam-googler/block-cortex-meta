include: "/views/base/campaigninsightsdailyagg.view"

view: +campaigninsightsdailyagg {

  dimension_group: date_val {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      day_of_week,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.report_date ;;
  }

  dimension: month {
    type: date_month
    sql: ${TABLE}.report_date;;

  }

  dimension: dt_quarter {
    type: date_quarter
    sql: ${date_val_raw} ;;

  }

  measure: total_impressions_sum {
    type: sum
    label: "Total Impressions"
    value_format_name: "positive_m_or_k"
    sql: ${TABLE}.total_impressions ;;
  }

  measure: total_video_view_sum {
    type: sum
    label: "Total Video View"
    value_format_name: "positive_m_or_k"
    sql: ${TABLE}.total_video_view ;;
  }

  measure: total_cost_sum {
    type: sum
    label: "Total Cost"
    value_format_name: "positive_usd_m_or_k"
    sql: ${TABLE}.total_spend ;;
  }

  measure: total_engagement_sum {
    type: sum
    label: "Total Engagement"
    value_format_name: "positive_m_or_k"
    sql: ${TABLE}.total_engagement ;;
  }

  measure: total_clicks_sum {
    type: sum
    label: "Total Clicks"
    value_format_name: "positive_m_or_k"
    sql: ${TABLE}.total_clicks ;;
  }

  measure: ctr_average{
    type: average
    label: "CTR Average"
    value_format:"0.00\%"
    sql: ${TABLE}.ctr ;;
  }

  measure: cpm_average{
    type: average
    label: "CPM Average"
    value_format_name: usd
    sql: ${TABLE}.cpm ;;
  }

  measure: engagement_rate_average{
    type: average
    label: "ER Average"
    value_format:"0.00\%"
    sql: ${TABLE}.engagement_rate ;;
  }

}
