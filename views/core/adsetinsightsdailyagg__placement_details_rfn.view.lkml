#########################################################################################################
# Purpose: Contains additional measures and calculations from CampaignInsightsDailyAgg table.

#########################################################################################################

include: "/views/base/adsetinsightsdailyagg__placement_details.view"
# The name of this view in Looker is "Adset Insights"
view: +adsetinsightsdailyagg__placement_details {

  ######### PRIMARY KEY #########
  dimension: adsetinsightsdailyagg__placement_details_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(CAST(${adsetinsightsdailyagg.adset_id} AS STRING), CAST(${adsetinsightsdailyagg.date} AS STRING), CAST(${offset} AS STRING)) ;;
  }

  dimension: platform_proper {
    type: string
    sql: INITCAP(${adsetinsightsdailyagg__placement_details.platform}) ;;
  }


  # Click on the type parameter to see all the options in the Quick Help panel on the right.
  # A measure with sum only.

  measure: sum_of_video_views_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your video plays for at least 3 seconds."
    sql: ${video_views} ;;
  }
  measure: sum_of_video_p95_watched_actions_video_views_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your video was played at 95% of its length, including plays that skipped to this point."
    sql: ${video_p95_watched_actions_video_views} ;;
  }
  measure: sum_of_impressions_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The number of times your ads were on screen."
    sql: ${impressions} ;;
  }
  measure: sum_of_spend_adset {
    type: sum
    value_format_name: "positive_m_or_k"
    description: "The estimated total amount of money you've spent on your campaign, ad set or ad during its schedule. This metric is estimated."
    sql: ${spend} ;;
  }

  #A measures with calculations
  measure: cpcv_adset{
    type: number
    value_format_name: usd
    description: "Pay for a video ad once the user watches a video in its entirety."
    sql: SAFE_DIVIDE(${sum_of_spend_adset}, ${sum_of_video_p95_watched_actions_video_views_adset}) ;;
  }
  measure: vtr_adset{
    type: number
    description: "The video p95 watched actions divided by impressions."
    sql: SAFE_DIVIDE(${sum_of_video_p95_watched_actions_video_views_adset}, ${sum_of_impressions_adset}) ;;
    value_format_name:percent_2
  }
}
