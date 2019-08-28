# This references to old QnA Maker, not working
# resource "azurerm_cognitive_account" "qna-mb" {
#   name                = "qna-mb"
#   location            = "${azurerm_resource_group.k8s.location}"
#   resource_group_name = "${azurerm_resource_group.k8s.name}"
#   kind                = "QnAMaker"

#   sku {
#     name = "${var.cognitive_service_sku}"
#     tier = "${var.cognitive_service_tier}"
#   }

#   tags = {
#     Environment = "${var.envtag}"
#   }
# }