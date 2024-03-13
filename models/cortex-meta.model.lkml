connection: "@{CONNECTION_NAME}"

# include explores and other objects
include: "/views/**/*.view.lkml"
include: "/explores/**/*.explore"
include: "/dashboards/*.dashboard.lookml"

datagroup: meta_report_default_datagroup {
# sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: meta_report_default_datagroup


named_value_format: positive_m_or_k {
  value_format: "[>1000000]0.0,,\"M\";[>1000]0.0,\"K\";0"
  strict_value_format: yes
}

named_value_format: positive_usd_m_or_k {
  value_format: "[>1000000]$0.0,,\"M\";[>1000]$0.0,\"K\";$0"
  strict_value_format: yes
}
