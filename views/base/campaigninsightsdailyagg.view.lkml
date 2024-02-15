view: campaigninsightsdailyagg {
  derived_table: {
    sql: select
        campaign.report_date,
        campaign.campaign_name,
        country_details.country,
        campaign.total_impressions,
        campaign.video_view,
        campaign.total_spend,
        SAFE_DIVIDE(campaign.total_spend, campaign.total_impressions / 1000) as cpm,
        campaign.frequency,
        campaign.post_engagement,
        SAFE_DIVIDE( campaign.post_engagement, campaign.total_reach) * 100 as engagement_rate,
        campaign.link_clicks,
        SAFE_DIVIDE( campaign.video_p95_watched_actions_video_views, campaign.total_impressions) * 100 as vtr,
        campaign.total_reach,
        campaign.campaign_start_time,
        campaign.campaign_stop_time,
        SAFE_DIVIDE( campaign.link_clicks, campaign.total_impressions) * 100 as link_ctr,
        placement_details.platform_position as placement,
        placement_details.publisher_platform as platform,
        campaign.post_shares,
        campaign.post_reaction,
        campaign.post_save,
        campaign.post_comments,
        campaign.page_like,
        SAFE_DIVIDE( campaign.total_spend, campaign.post_engagement) as cpe,
        --new row
        SAFE_DIVIDE( campaign.total_spend, campaign.video_p95_watched_actions_video_views) as cpcv
      from `kittycorn-dev-epam.looker_reporting_meta.CampaignInsightsDailyAgg` campaign,
      UNNEST(placement_details) as placement_details,
      UNNEST(country_details) as country_details;;
  }

  dimension: date {
    type: date
    datatype: date
    description: "API data extraction date to be used for Reporting Use cases."
    sql: ${TABLE}.report_date ;;
  }
  dimension: month {
    type: date_month
    description: "API data extraction date to be used for Reporting Use cases."
    sql: ${TABLE}.report_date;;
  }
  dimension: campaign_name {
    type: string
    description: "The name of the ad Campaign you're viewing in reporting. Your campaign contains ad sets and ads."
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: country {
    type: string
    description: "The country (in ISO format) where the people you've reached are located. This is based on information, such as a person's hometown, their current city, and the geographical location where they tend to be when they visit Meta."
    sql: ${TABLE}.country ;;
  }
  dimension: total_impressions {
    type: number
    description: "The number of times your ads were on screen."
    sql: ${TABLE}.total_impressions ;;
  }
  dimension: total_video_view {
    type: number
    description: "The number of times your video plays for at least 3 seconds"
    sql: ${TABLE}.video_view ;;
  }
  dimension: total_cost {
    type: number
    description: "The estimated total amount of money you've spent on your campaign, ad set or ad during its schedule. This metric is estimated."
    sql: ${TABLE}.total_spend ;;
  }
  dimension: cpm {
    type: number
    description: "The average cost for 1,000 impressions."
    sql: ${TABLE}.cpm ;;
  }
  dimension: frequency {
    type: number
    description: "The average number of times each person saw your ad. This metric is estimated."
    sql: ${TABLE}.frequency ;;
  }
  dimension: post_engagement {
    type: number
    description: "Post engagements are the total number of actions that people take involving your ads"
    sql: ${TABLE}.post_engagement ;;
  }
  dimension: engagement_rate {
    type: number
    description: "The total engagement divided by total reach."
    sql: ${TABLE}.engagement_rate ;;
  }
  dimension: total_clicks {
    type: number
    description: "The number of clicks on links within the ad that led to advertiser-specified destinations, on or off Meta technologies."
    sql: ${TABLE}.link_clicks ;;
  }
  dimension: vtr {
    type: number
    description: "The video p95 watched actions divided by impressions."
    sql: ${TABLE}.vtr ;;
  }
  dimension: total_reach {
    type: number
    description: "The number of people who saw your ads at least once. "
    sql: ${TABLE}.total_reach ;;
  }
  dimension: campaign_start_date {
    type: date
    description: "Merging of start_times for the ad sets belonging to this campaign. At the campaign level, start_time is a read only field. You can setup start_time at the ad set level."
    sql: ${TABLE}.campaign_start_time;;
  }
  dimension: campaign_stop_date {
    type: date
    description: "Merging of stop_times for the ad sets belonging to this campaign. At the campaign level, stop_time is a read only field. You can setup stop_time at the ad set level."
    sql: ${TABLE}.campaign_stop_time ;;
  }
  dimension: link_ctr {
    type: number
    description: "The number of clicks that your ad receives divided by the number of times your ad is shown"
    sql: ${TABLE}.link_ctr ;;
  }
  dimension: placement {
    type: string
    description: "Which platform your ad was shown, for example on Facebook, Instagram, or Audience Network."
    sql: ${TABLE}.placement ;;
  }
  dimension: platform {
    type: string
    description: "Where your ad was shown within a platform, for example on Facebook desktop Feed, or Instagram Mobile Feed."
    sql: ${TABLE}.platform ;;
  }
  dimension: shares {
    type: number
    description: "The number of shares of your ads. People can share your ads or posts on their own or friends' Timelines, in groups and on their own Pages. "
    sql: ${TABLE}.post_shares ;;
  }
  dimension: reactions {
    type: number
    description: "The number of reactions on your ads.The number of reactions on your ads."
    sql: ${TABLE}.post_reaction ;;
  }
  dimension: saves {
    type: number
    description: "Post saves counts the number of times your ad was saved by people who want to revisit it at a later time. "
    sql: ${TABLE}.post_save ;;
  }
  dimension: comments {
    type: number
    description: "The number of comments on your ads."
    sql: ${TABLE}.post_comments ;;
  }
  dimension: page_likes {
    type: number
    description: "The number of likes of your Facebook Page, attributed to your ads."
    sql: ${TABLE}.page_like ;;
  }
  dimension: cpe {
    type: number
    description: "Compares the cost to the total amount of engagements on a Facebook post that include: likes and reactions. comments. shares."
    sql: ${TABLE}.cpe ;;
  }
  dimension: cpcv {
    type: number
    description: "Pay for a video ad once the user watches a video in its entirety"
    sql: ${TABLE}.cpcv ;;
  }
}
