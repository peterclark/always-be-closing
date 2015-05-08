Template.show_configuration.helpers

  lineItems: (configuration) ->
    LineItem.find configuration_id: @_id
    
  offerings: (configuration) ->
    Offering.all()