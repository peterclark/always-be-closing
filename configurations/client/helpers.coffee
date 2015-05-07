Template.show_configuration.helpers

  lineItems: (line_item) ->
    LineItem.find configuration_id: @_id
    
  offerings: (configuration) ->
    Offering.all()