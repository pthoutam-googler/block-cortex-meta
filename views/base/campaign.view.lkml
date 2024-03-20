view: campaign {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.looker_reporting_meta.Campaign` ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
