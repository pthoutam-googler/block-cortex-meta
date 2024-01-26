view: campaigninsightsdailyagg {
  derived_table: {
    sql: select
        campaign.campaign_name,
        campaign.campaign_status,
        country_details.country,
        campaign.campaign_objective,
        campaign.campaign_id,
        campaign.account_id,
        campaign.report_date,
        campaign.campaign_start_time,
        campaign.campaign_stop_time,
        campaign.total_spend,
        campaign.total_clicks,
        campaign.frequency,
        campaign.total_impressions,
        campaign.total_reach,
        campaign.total_spend/(campaign.total_impressions/1000) as cpm,
        campaign.video_view as total_video_view,
        campaign.video_p95_watched_actions,
        (campaign.total_clicks/campaign.total_impressions)*100 as ctr,
        placement_details.platform_position as placement,
        placement_details.publisher_platform as platform,
        (campaign.video_view/campaign.video_p95_watched_actions)*100 as cvr,
        campaign.total_spend/campaign.video_p95_watched_actions as cpcv,
        campaign.link_clicks,
        campaign.post_shares,
        campaign.post_reaction,
        campaign.post_save,
        campaign.post_comments,
        campaign.`like`,
        campaign.video_view,
        campaign.photo_view,
        campaign.sad,
        campaign.wow,
        campaign.love,
        campaign.haha,
        campaign.angry,
        (campaign.sad+campaign.wow+campaign.love+campaign.`like`+campaign.haha+campaign.angry) as total_reaction,
        COALESCE(campaign.link_clicks, 0)+COALESCE(campaign.post_shares, 0)+COALESCE(campaign.post_reaction, 0)+COALESCE(campaign.post_save, 0)+COALESCE(campaign.post_comments, 0)+COALESCE(campaign.`like`, 0)+COALESCE(campaign.video_view, 0)+COALESCE(campaign.photo_View, 0) as total_engagement,
        ((COALESCE(campaign.link_clicks, 0)+COALESCE(campaign.post_shares, 0)+COALESCE(campaign.post_reaction, 0)+COALESCE(campaign.post_save, 0)+COALESCE(campaign.post_comments, 0)+COALESCE(campaign.`like`, 0)+COALESCE(campaign.video_view, 0)+COALESCE(campaign.photo_View, 0))/campaign.total_reach)*100 as engagement_rate,
        campaign.total_spend/ NULLIF(COALESCE(campaign.link_clicks, 0)+COALESCE(campaign.post_shares, 0)+COALESCE(campaign.post_reaction, 0)+COALESCE(campaign.post_save, 0)+COALESCE(campaign.post_comments, 0)+COALESCE(campaign.`like`, 0)+COALESCE(campaign.video_view, 0)+COALESCE(campaign.photo_View, 0), 0) as cpe
      from `kittycorn-dev-epam.looker_reporting_meta.CampaignInsightsDailyAgg` campaign
      LEFT JOIN UNNEST(placement_details) as placement_details
      LEFT JOIN UNNEST(country_details) as country_details;;
  }

  dimension: campaign_name {
    type: string
    description: "The name of your ad account, which groups your advertising activity"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_status {
    type: string
    description: "If this status is PAUSED, all its active ad sets and ads will be paused and have an effective status CAMPAIGN_PAUSED"
    sql: ${TABLE}.campaign_status ;;
  }

  dimension: country {
    type: string
    description: "Country"
    sql: ${TABLE}.country ;;
  }

  dimension: campaign_objective {
    type: string
    description: "Campaign's objective"
    sql: ${TABLE}.campaign_objective ;;
  }

  dimension: campaign_id {
    type: number
    description: "Id of campaigns"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: account_id {
    type: number
    description: "The ID number of your ad account, which groups your advertising activity"
    sql: ${TABLE}.account_id ;;
  }

  dimension: report_date {
    type: date
    datatype: date
    description: "API data extraction date to be used for Reporting Use cases"
    sql: ${TABLE}.report_date ;;
  }

  dimension: campaign_start_time {
    type: date_time
    datatype: date
    description: "Merging of start_times for the ad sets belonging to this campaign"
    sql: CAST(${TABLE}.campaign_start_time AS datetime) ;;
  }

  dimension: campaign_stop_time {
    type: date_time
    datatype: date
    description: "Merging of stop_times for the ad sets belonging to this campaign, if available"
    sql: CAST(${TABLE}.campaign_stop_time AS datetime) ;;
  }

  dimension: total_spend {
    type: number
    description: "The estimated total amount of money you've spent on your campaign, ad set or ad during its schedule. This metric is estimated"
    sql: ${TABLE}.total_spend ;;
  }

  dimension: total_clicks {
    type: number
    description: "The Number of clicks on your ads"
    sql: ${TABLE}.total_clicks ;;
  }

  dimension: frequency {
    type: number
    description: "The average number of times each person saw your ad. This metric is estimated"
    sql: ${TABLE}.frequency ;;
  }

  dimension: total_impressions {
    type: number
    description: "The number of times your ads were on screen"
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: total_reach {
    type: number
    description: "The number of people who saw your ads at least once"
    sql: ${TABLE}.total_reach ;;
  }

  dimension: cpm {
    type: number
    description: "The average amount of money you've spent per 1,000 impressions"
    sql: ${TABLE}.cpm ;;
  }

  dimension: total_video_view {
    type: number
    sql: ${TABLE}.total_video_view ;;
  }

  dimension: video_p95_watched_actions {
    type: number
    sql: ${TABLE}.video_p95_watched_actions ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: cvr {
    type: number
    sql: ${TABLE}.cvr ;;
  }

  dimension: cpcv {
    type: number
    sql: ${TABLE}.cpv ;;
  }

  dimension: link_clicks {
    type: number
    sql: ${TABLE}.link_clicks ;;
  }

  dimension: post_shares {
    type: number
    sql: ${TABLE}.post_shares ;;
  }

  dimension: post_reaction {
    type: number
    sql: ${TABLE}.post_reaction ;;
  }

  dimension: post_save {
    type: number
    sql: ${TABLE}.post_save ;;
  }

  dimension: post_comments {
    type: number
    sql: ${TABLE}.post_comments ;;
  }

  dimension: like {
    type: number
    sql: ${TABLE}.`like` ;;
  }

  dimension: sad {
    type: number
    sql: ${TABLE}.sad ;;
  }

  dimension: wow {
    type: number
    sql: ${TABLE}.wow ;;
  }

  dimension: angry {
    type: number
    sql: ${TABLE}.angry ;;
  }

  dimension: love {
    type: number
    sql: ${TABLE}.love ;;
  }

  dimension: haha {
    type: number
    sql: ${TABLE}.haha ;;
  }

  dimension: total_reaction {
    type: number
    sql: ${TABLE}.total_reaction ;;
  }

  dimension: video_view {
    type: number
    sql: ${TABLE}.video_view ;;
  }

  dimension: photo_View {
    type: number
    sql: ${TABLE}.photo_View ;;
  }

  dimension: total_engagement {
    type: number
    sql: ${TABLE}.total_engagement ;;
  }

  dimension: engagement_rate {
    type: number
    sql: ${TABLE}.engagement_rate ;;
  }

  dimension: cpe {
    type: number
    sql: ${TABLE}.cpe ;;
  }

}
