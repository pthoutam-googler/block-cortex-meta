view: campaign {
  sql_table_name: `kittycorn-dev-epam.looker_reporting_meta.Campaign` ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
