view: subscribers_daily_agg {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.SubscribersDailyAgg` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }


  dimension: num_of_joined {
    type: number
    sql: ${TABLE}.NumOfJoined ;;
  }
  dimension: num_of_unsubscribed {
    type: number
    sql: ${TABLE}.NumOfUnsubscribed ;;
  }
  dimension: total_active {
    type: number
    sql: ${TABLE}.TotalActive ;;
  }
  dimension: total_bounced {
    type: number
    sql: ${TABLE}.TotalBounced ;;
  }
  dimension: total_held {
    type: number
    sql: ${TABLE}.TotalHeld ;;
  }
  dimension: total_unsubscribed {
    type: number
    sql: ${TABLE}.TotalUnsubscribed ;;
  }
  measure: count {
    type: count
  }
}
