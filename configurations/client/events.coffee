Template.configuration.events

  # delete the option
  "click .delete": (e) ->
    e.preventDefault()
    configuration = @
    Meteor.call "destroyConfiguration", configuration._id, (error, result) ->
      if error
        sAlert.error error.reason
      else
        sAlert.success "Configuration '#{configuration.name}' was deleted."

Template.show_configuration.events
        
  # add a line item
  'change #add-line-item': (e) ->
    configuration = @
    params = { 
      configuration_id: configuration._id,
      offering_id: $(e.target).val()
    }
    console.log params
    # Meteor.call "addLineItem", params, (error, result) ->
    #   if error
    #     sAlert.error error.reason
    #   else
    #     sAlert.success ""