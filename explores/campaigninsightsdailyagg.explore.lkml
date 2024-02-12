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
}

explore: adsetinsightsdailyagg {
  label: "Adset Insights"
}
