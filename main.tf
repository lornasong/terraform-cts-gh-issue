# Create repository: "cts-labels"
resource "github_repository" "cts-labels" {
  name        = "cts-labels"
  description = "CTS automated repository to manage labels"

  visibility  = "public"
  has_issues = true
}

# Create new label with service-instance id as label-name. Service address +
# port as label-description
resource "github_issue_label" "cts-labels" {
  repository = "cts-labels"
  color = "CA2171"

  for_each = var.services
  name = each.value.id
  description = "${each.value.address}:${each.value.port}"
}
