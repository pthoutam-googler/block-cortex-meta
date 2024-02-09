view: adsetinsightsdailyagg {
  derived_table: {
     sql: with A as(
     SELECT distinct
         adset_id,
         STRING_AGG(distinct targeting_audiences.name, " + ") as sub_names
     FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg` ad
     LEFT JOIN UNNEST(targeting_audiences) as targeting_audiences
     group by adset_id
     )
     SELECT
      ad.total_impressions,
      A.sub_names,
      SAFE_DIVIDE( ad.total_spend, ad.total_impressions / 1000) as cpm,
      SAFE_DIVIDE( ad.link_clicks, ad.total_impressions) * 100 as link_ctr,
      ad.post_engagement,
      platform_details.publisher_platform as platform,
      SAFE_DIVIDE( ad.post_engagement, ad.total_reach) * 100 as engagement_rate,
      SAFE_DIVIDE( ad.total_spend, ad.post_engagement) as cpe,
      ad.video_view,
      SAFE_DIVIDE( ad.video_p95_watched_actions_video_views, ad.total_impressions) * 100 as vtr,
      SAFE_DIVIDE( ad.total_spend, ad.video_p95_watched_actions_video_views) as cpcv
     FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg` ad
     LEFT JOIN UNNEST(targeting_audiences) as targeting_audiences
     LEFT JOIN UNNEST(platform_details) as platform_details
     INNER JOIN A USING(adset_id);;
  }
  dimension: total_impressions_adset {
    type: number
    description: "The number of times your ads were on screen."
    sql: ${TABLE}.total_impressions ;;
  }
  dimension: adset_name {
    type: string
    description: "Names of the audiences or interests"
    sql: ${TABLE}.sub_names ;;
  }
  dimension: cpm {
    type: number
    description: "The average cost for 1,000 impressions."
    sql: ${TABLE}.cpm ;;
  }
  dimension: link_ctr {
    type: number
    description: "The number of clicks that your ad receives divided by the number of times your ad is shown"
    sql: ${TABLE}.link_ctr ;;
  }
  dimension: post_engagement_adset {
    type: number
    description: "Post engagements are the total number of actions that people take involving your ads"
    sql: ${TABLE}.post_engagement;;
  }
  dimension: platform {
    type: string
    description: "Which platform your ad was shown, for example on Facebook, Instagram, or Audience Network."
    sql: ${TABLE}.platform ;;
  }
  dimension: engagement_rate {
    type: number
    description: "The total engagement divided by total reach."
    sql: ${TABLE}.engagement_rate ;;
  }
  dimension: cpe {
    type: number
    description: "Compares the cost to the total amount of engagements on a Facebook post that include: likes and reactions. comments. shares."
    sql: ${TABLE}.cpe ;;
  }
  dimension: total_video_view {
    type: number
    description: "The number of times your video plays for at least 3 seconds"
    sql: ${TABLE}.video_view ;;
  }
  dimension: vtr {
    type: number
    description: "The video p95 watched actions divided by impressions."
    sql: ${TABLE}.vtr;;
  }
  dimension: cpcv {
    type: number
    description: "Pay for a video ad once the user watches a video in its entirety"
    sql: ${TABLE}.cpcv ;;
  }
}
