# Please change the connection values before deploying to production

constant: CONNECTION_NAME {
  value: "dev-sfmc"
  export: override_required
}


constant: GCP_PROJECT_ID {
  value: "kittycorn-dev-epam"
  export: override_required
}

constant: REPORTING_DATASET {
  value: "looker_reporting_sfmc"
  export: override_required
}
