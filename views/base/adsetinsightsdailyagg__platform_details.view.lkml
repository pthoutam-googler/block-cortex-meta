view: adsetinsightsdailyagg__platform_details {

  dimension: post_engagement {
    type: number
    sql: ${TABLE}.post_engagement ;;
  }
  dimension: platform {
    type: string
    sql: publisher_platform ;;
  }
  dimension: total_reach {
    type: number
    sql: ${TABLE}.total_reach ;;
  }
  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
  }
}
