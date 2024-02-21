#########################################################################################################
# Purpose: Contains additional measures and calculations from CampaignInsightsDailyAgg table, Placement Details nested records.

#########################################################################################################

include: "/views/base/campaigninsightsdailyagg__placement_details.view"
# The name of this view in Looker is "Campaign Insights"
view: +campaigninsightsdailyagg__placement_details {


  # A measure is a field that uses a SQL aggregate function.
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.
  # A measure with sum only.
  measure: sum_of_total_impressions_placement {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your ads were on screen."
    sql: ${total_impressions} ;;
  }
  measure: sum_of_total_spend_placement {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The estimated total amount of money you've spent on your campaign, ad set or ad during its schedule. This metric is estimated."
    sql: ${total_spend} ;;
  }
  measure: sum_of_link_clicks_placement {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of clicks on links within the ad that led to advertiser-specified destinations, on or off Meta technologies."
    sql: ${link_clicks} ;;
  }
  measure: sum_of_total_video_view_placement {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your video plays for at least 3 seconds."
    sql: ${video_view} ;;
  }
  measure: sum_of_video_p95_watched_actions_video_views_placement {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your video was played at 95% of its length, including plays that skipped to this point."
    sql: ${video_p95_watched_actions_video_views} ;;
  }

  #A measures with calculations
  measure: cpm_placement{
    type: number
    value_format_name: usd
    description: "The average cost for 1,000 impressions."
    sql: SAFE_DIVIDE(${sum_of_total_spend_placement}, ${sum_of_total_impressions_placement} / 1000) ;;
  }
  measure: link_ctr_placement{
    type: number
    description: "The number of clicks that your ad receives divided by the number of times your ad is shown."
    sql: SAFE_DIVIDE( ${sum_of_link_clicks_placement}, ${sum_of_total_impressions_placement}) ;;
    value_format_name:percent_2
  }
  measure: vtr_placement{
    type: number
    description: "The video p95 watched actions divided by impressions."
    sql: SAFE_DIVIDE( ${sum_of_video_p95_watched_actions_video_views_placement}, ${sum_of_total_impressions_placement}) ;;
    value_format_name:percent_2
  }
  measure: cpcv_placement{
    type: number
    value_format_name: usd
    description: "Pay for a video ad once the user watches a video in its entirety."
    sql: SAFE_DIVIDE( ${sum_of_total_spend_placement}, ${sum_of_video_p95_watched_actions_video_views_placement}) ;;
  }
}
