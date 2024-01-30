view: adsetinsightsdailyagg {
  derived_table: {
    sql: with A as(
SELECT distinct
    targeting_audiences.id,
    STRING_AGG(distinct targeting_audiences.name, ", " ORDER BY targeting_audiences.name) as sub_names
FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg` ad
LEFT JOIN UNNEST(targeting_audiences) as targeting_audiences
group by targeting_audiences.id
)
SELECT
 targeting_audiences.id as audiences_id,
 A.sub_names,
 ad.campaign_id,
 ad.report_date,
 ad.account_id,
 ad.total_impressions,
 COALESCE(ad.link_clicks, 0)+COALESCE(ad.post_shares, 0)+COALESCE(ad.post_reaction, 0)+COALESCE(ad.post_save, 0)+COALESCE(ad.post_comments, 0)+COALESCE(ad.`like`, 0)+COALESCE(ad.video_view, 0)+COALESCE(ad.photo_View, 0) as total_engagement,
 ad.video_p95_watched_actions_video_views,
 (ad.total_clicks/ad.total_impressions)*100 as ctr,
 ad.total_spend/(ad.total_impressions/1000) as cpm,
 ((COALESCE(ad.link_clicks, 0)+COALESCE(ad.post_shares, 0)+COALESCE(ad.post_reaction, 0)+COALESCE(ad.post_save, 0)+COALESCE(ad.post_comments, 0)+COALESCE(ad.`like`, 0)+COALESCE(ad.video_view, 0)+COALESCE(ad.photo_View, 0))/ad.total_reach)*100 as engagement_rate,
 ad.video_p95_watched_actions_video_views*100/ad.video_view as cvr,
 ad.total_spend/ad.video_p95_watched_actions_video_views as cpcv,
FROM `kittycorn-dev-epam.looker_reporting_meta.AdsetInsightsDailyAgg` ad
LEFT JOIN UNNEST(targeting_audiences) as targeting_audiences
INNER JOIN A USING(id);;
  }

  dimension: audiences_id {
    type: number
    sql: ${TABLE}.audiences_id ;;
  }

  dimension: sub_names {
    type: string
    sql: ${TABLE}.sub_names ;;
  }

  dimension: campaign_id {
    type: number
    description: "Id of campaigns"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: report_date {
    type: date
    description: "API data extraction date to be used for Reporting Use cases"
    sql: ${TABLE}.report_date ;;
  }

  dimension: account_id {
    type: number
    description: "The ID number of your ad account, which groups your advertising activity"
    sql: ${TABLE}.account_id ;;
  }

  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: subtype {
    type: string
    description: "Audience which we know"
    sql: ${TABLE}.subtype ;;
  }

  dimension: total_engagement {
    type: number
    sql: ${TABLE}.total_engagement ;;
  }

  dimension: video_p95_watched_actions_video_views {
    type: number
    sql: ${TABLE}.video_p95_watched_actions_video_views ;;
  }

  dimension: ctr {
    type: number
    description: "The Number of clicks on your ads devided by he number of times your ads were on screen"
    sql: ${TABLE}.ctr ;;
  }

  dimension: cpm {
    type: number
    description: "The average amount of money you've spent per 1,000 impressions"
    sql: ${TABLE}.cpm ;;
  }

  dimension: engagement_rate {
    type: number
    sql: ${TABLE}.engagement_rate ;;
  }

  dimension: cvr {
    type: number
    description: "Page Video Views devidev by The number of times your video was played at 95% of its length, including plays that skipped to this point"
    sql: ${TABLE}.cvr ;;
  }

  dimension: cpcv {
    type: number
    sql: ${TABLE}.cpcv ;;
  }
}
