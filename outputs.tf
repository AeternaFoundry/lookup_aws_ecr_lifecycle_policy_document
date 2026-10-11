output "ecr_lifecycle_policy_document_lookup_json" {
  description = "Map of json values across all ecr_lifecycle_policy_document_lookup, keyed the same as var.ecr_lifecycle_policy_document_lookup"
  value       = { for k, v in data.aws_ecr_lifecycle_policy_document.ecr_lifecycle_policy_document_lookup : k => v.json if v.json != null && length(v.json) > 0 }
}
output "ecr_lifecycle_policy_document_lookup_rule" {
  description = "Map of rule values across all ecr_lifecycle_policy_document_lookup, keyed the same as var.ecr_lifecycle_policy_document_lookup"
  value       = { for k, v in data.aws_ecr_lifecycle_policy_document.ecr_lifecycle_policy_document_lookup : k => v.rule if v.rule != null && length(v.rule) > 0 }
}

