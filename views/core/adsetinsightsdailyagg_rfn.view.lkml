#########################################################################################################
# Purpose: Contains additional measures and calculations from CampaignInsightsDailyAgg table.

#########################################################################################################

include: "/views/base/adsetinsightsdailyagg.view"
# The name of this view in Looker is "Campaign Insights"
view: +adsetinsightsdailyagg {

  ######### PRIMARY KEY #########
  dimension: adsetinsightsdailyagg_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${adset_id}, ${date}) ;;
  }

  # A measure is a field that uses a SQL aggregate function.
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.
  # A measure with sum only.

  measure: sum_of_total_impressions_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your ads were on screen."
    sql: ${total_impressions} ;;
  }
  measure: sum_of_total_spend_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The estimated total amount of money you've spent on your campaign, ad set or ad during its schedule. This metric is estimated."
    sql: ${total_spend} ;;
  }
  measure: sum_of_link_clicks_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of clicks on links within the ad that led to advertiser-specified destinations, on or off Meta technologies."
    sql: ${link_clicks} ;;
  }

  #A measures with calculations
  measure: cpm_adset{
    type: number
    value_format_name: usd
    description: "The average cost for 1,000 impressions."
    sql: SAFE_DIVIDE(${sum_of_total_spend_adset}, ${sum_of_total_impressions_adset} / 1000) ;;
  }
  measure: link_ctr_adset{
    type: number
    description: "The number of clicks that your ad receives divided by the number of times your ad is shown."
    sql: SAFE_DIVIDE( ${sum_of_link_clicks_adset}, ${sum_of_total_impressions_adset}) ;;
    value_format_name:percent_2
  }
}
