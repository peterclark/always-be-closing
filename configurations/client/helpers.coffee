Template.show_configuration.helpers

  lineItems: (configuration) ->
    LineItem.find configuration_id: @_id
    
  offerings: (configuration) ->
    Offering.all()
    
  totalLineItems: (configuration) ->
    LineItem.count( configuration_id: @_id )