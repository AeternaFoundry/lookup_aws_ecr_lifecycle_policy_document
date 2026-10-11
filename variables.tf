variable "ecr_lifecycle_policy_document_lookup" {
  description = <<EOT
Map of ecr_lifecycle_policy_document_lookup, attributes below
Optional:
    - rule (block):
        - action (optional, block):
            - target_storage_class (optional)
            - type (required)
        - description (optional)
        - priority (required)
        - selection (optional, block):
            - count_number (required)
            - count_type (required)
            - count_unit (optional)
            - storage_class (optional)
            - tag_pattern_list (optional)
            - tag_prefix_list (optional)
            - tag_status (required)
EOT

  type = map(object({
    rule = optional(list(object({
      action = optional(list(object({
        target_storage_class = optional(string)
        type                 = string
      })))
      description = optional(string)
      priority    = number
      selection = optional(list(object({
        count_number     = number
        count_type       = string
        count_unit       = optional(string)
        storage_class    = optional(string)
        tag_pattern_list = optional(list(string))
        tag_prefix_list  = optional(list(string))
        tag_status       = string
      })))
    })))
  }))
}

