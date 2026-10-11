data "aws_ecr_lifecycle_policy_document" "ecr_lifecycle_policy_document_lookup" {
  for_each = var.ecr_lifecycle_policy_document_lookup


  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      dynamic "action" {
        for_each = rule.value.action != null ? rule.value.action : []
        content {
          target_storage_class = action.value.target_storage_class
          type                 = action.value.type
        }
      }
      description = rule.value.description
      priority    = rule.value.priority
      dynamic "selection" {
        for_each = rule.value.selection != null ? rule.value.selection : []
        content {
          count_number     = selection.value.count_number
          count_type       = selection.value.count_type
          count_unit       = selection.value.count_unit
          storage_class    = selection.value.storage_class
          tag_pattern_list = selection.value.tag_pattern_list
          tag_prefix_list  = selection.value.tag_prefix_list
          tag_status       = selection.value.tag_status
        }
      }
    }
  }
}

