#include: "/views/core/campaigninsightsdailyagg_rfn.view"
include: "/views/**/*.view.lkml"

#explore: campaigninsightsdailyagg {
#  label: "Campaign Insights"
 # join: adsetinsightsdailyagg {
 #   type: left_outer
 #   relationship: many_to_one
 #   sql_on: ${campaigninsightsdailyagg.campaign_id} = ${adsetinsightsdailyagg.campaign_id} and ${campaigninsightsdailyagg.report_date} = ${adsetinsightsdailyagg.report_date} and ${campaigninsightsdailyagg.account_id} = ${adsetinsightsdailyagg.account_id};;
 # }
#}

explore: campaigninsightsdailyagg {
  label: "Campaign Insights"
  join: campaigninsightsdailyagg__placement_details {
    view_label: "Campaign Insights Daily Agg: Placement Details"
    sql: LEFT JOIN UNNEST(${campaigninsightsdailyagg.placement_details}) as campaigninsightsdailyagg__placement_details ;;
    relationship: one_to_many
  }
}

explore: adsetinsightsdailyagg {
  label: "Adset Insights"
  join: adsetinsightsdailyagg__targeting_audiences_sdt {
    view_label: "Adset Insights Daily Agg: Targeting Audiences"
    sql_on: ${adsetinsightsdailyagg__targeting_audiences_sdt.adset_id} = ${adsetinsightsdailyagg.adset_id} ;;
    relationship: one_to_many
  }
  join: adsetinsightsdailyagg__placement_details {
    view_label: "Adset Insights Daily Agg: Placement Details"
    sql: LEFT JOIN UNNEST(${adsetinsightsdailyagg.placement_details}) as adsetinsightsdailyagg__placement_details ;;
    relationship: one_to_many
  }
  join: adsetinsightsdailyagg__platform_details {
    view_label: "Adset Insights Daily Agg: Platform Details"
    sql: LEFT JOIN UNNEST(${adsetinsightsdailyagg.platform_details}) as adsetinsightsdailyagg__platform_details ;;
    relationship: one_to_many
  }

}
