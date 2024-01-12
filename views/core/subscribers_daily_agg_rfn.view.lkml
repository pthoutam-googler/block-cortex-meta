include: "/views/base/subscribers_daily_agg.view"

view: +subscribers_daily_agg {

  dimension: date_pk {
    type: date
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.date ;;
  }

  dimension_group: date {
    label: "Activity"
    }

 }
