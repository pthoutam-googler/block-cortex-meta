#########################################################################################################
# Purpose: Contains additional measures and calculations from CampaignInsightsDailyAgg table.

#########################################################################################################

include: "/views/base/adsetinsightsdailyagg__platform_details.view"
# The name of this view in Looker is "Adset Insights"
view: +adsetinsightsdailyagg__platform_details {

  ######### PRIMARY KEY #########
  dimension: adsetinsightsdailyagg__platform_details_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${adsetinsightsdailyagg.adset_id}, ${adsetinsightsdailyagg.date}) ;;
  }

  # A measure is a field that uses a SQL aggregate function.
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.
  # A measure with sum only.

  measure: sum_of_post_engagement_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "Post engagements are the total number of actions that people take involving your ads."
    sql: ${post_engagement} ;;
  }
  measure: sum_of_total_reach_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of people who saw your ads at least once. "
    sql: ${total_reach} ;;
  }
  measure: sum_of_total_spend_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The estimated total amount of money you've spent on your campaign, ad set or ad during its schedule. This metric is estimated."
    sql: ${total_spend} ;;
  }

  #A measures with calculations
  measure: engagement_rate_adset{
    type: number
    description: "The total engagement divided by total reach."
    sql: SAFE_DIVIDE( ${sum_of_post_engagement_adset}, ${sum_of_total_reach_adset}) ;;
    value_format_name:percent_2
  }
  measure: cpe_adset{
    type: number
    value_format:"0.00\%"
    description: "Compares the cost to the total amount of engagements on a Facebook post that include: likes and reactions. comments. shares."
    sql: SAFE_DIVIDE( ${sum_of_total_spend_adset}, ${sum_of_post_engagement_adset}) ;;
  }
}
