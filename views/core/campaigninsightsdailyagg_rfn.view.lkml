#########################################################################################################
# Purpose: Contains additional measures and calculations from CampaignInsightsDailyAgg table.

#########################################################################################################

include: "/views/base/campaigninsightsdailyagg.view"
# The name of this view in Looker is "Campaign Insights"
view: +campaigninsightsdailyagg {

  ######### PRIMARY KEY #########
  dimension: campaigninsightsdailyagg_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.campaign_id, ${TABLE}.account_id, ${TABLE}.report_date) ;;
  }

  # A measure is a field that uses a SQL aggregate function.
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.
  # A measure with sum only.
  measure: sum_of_total_impressions {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your ads were on screen."
    sql: ${total_impressions} ;;
  }
  measure: sum_of_total_video_view {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your video plays for at least 3 seconds."
    sql: ${total_video_view} ;;
  }
  measure: sum_of_total_spend {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The estimated total amount of money you've spent on your campaign, ad set or ad during its schedule. This metric is estimated."
    sql: ${total_spend} ;;
  }
  measure: sum_of_post_engagement {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "Post engagements are the total number of actions that people take involving your ads."
    sql: ${post_engagement} ;;
  }
  measure: sum_of_total_clicks {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of clicks on links within the ad that led to advertiser-specified destinations, on or off Meta technologies."
    sql: ${total_clicks} ;;
  }
  measure: sum_of_total_reach {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of people who saw your ads at least once. "
    sql: ${total_reach} ;;
  }
  measure: sum_of_shares {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of shares of your ads. People can share your ads or posts on their own or friends' Timelines, in groups and on their own Pages."
    sql: ${shares} ;;
  }
  measure: sum_of_reactions {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of reactions on your ads."
    sql: ${reactions} ;;
  }
  measure: sum_of_saves {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "Post saves counts the number of times your ad was saved by people who want to revisit it at a later time."
    sql: ${saves} ;;
  }
  measure: sum_of_comments {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of comments on your ads."
    sql: ${comments} ;;
  }
  measure: sum_of_page_likes {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of likes of your Facebook Page, attributed to your ads."
    sql: ${page_likes} ;;
  }
  measure: sum_of_video_p95_watched_actions_video_views {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your video was played at 95% of its length, including plays that skipped to this point."
    sql: ${video_p95_watched_actions_video_views} ;;
  }
  measure: sum_of_link_clicks {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of clicks on links within the ad that led to advertiser-specified destinations, on or off Meta technologies."
    sql: ${link_clicks} ;;
  }

  #A measures with calculations
  measure: cpm{
    type: number
    value_format_name: usd
    description: "The average cost for 1,000 impressions."
    sql: SAFE_DIVIDE(${sum_of_total_spend}, ${sum_of_total_impressions} / 1000) ;;
  }
  measure: engagement_rate{
    type: number
    description: "The total engagement divided by total reach."
    sql: SAFE_DIVIDE( ${sum_of_post_engagement}, ${sum_of_total_reach}) ;;
    value_format_name:percent_2
  }
  measure: link_ctr{
    type: number
    description: "The number of clicks that your ad receives divided by the number of times your ad is shown."
    sql: SAFE_DIVIDE( ${sum_of_link_clicks}, ${sum_of_total_impressions}) ;;
    value_format_name:percent_2
  }
  measure: cpe{
    type: number
    value_format:"0.00\%"
    description: "Compares the cost to the total amount of engagements on a Facebook post that include: likes and reactions. comments. shares."
    sql: SAFE_DIVIDE( ${sum_of_total_spend}, ${sum_of_post_engagement}) ;;
  }
  measure: cpcv{
    type: number
    value_format_name: usd
    description: "Pay for a video ad once the user watches a video in its entirety."
    sql: SAFE_DIVIDE( ${sum_of_total_spend}, ${sum_of_video_p95_watched_actions_video_views}) ;;
  }
  measure: frequency {
    type: number
    value_format_name: "positive_m_or_k"
    description: "The average number of times each person saw your ad. This metric is estimated."
    sql: SAFE_DIVIDE( ${sum_of_total_impressions}, ${sum_of_total_reach}) ;;
  }
  measure: vtr{
    type: number
    description: "The video p95 watched actions divided by impressions."
    sql: SAFE_DIVIDE( ${sum_of_video_p95_watched_actions_video_views}, ${sum_of_total_impressions}) ;;
    value_format_name:percent_2
  }
}
