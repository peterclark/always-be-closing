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
  'change #create-line-item': (e) ->
    configuration = @
    name = $(e.target).find('option:selected').text()
    console.log name
    params = { 
      configuration_id: configuration._id,
      offering_id: $(e.target).val()
    }
    Meteor.call "createLineItem", params, (error, result) ->
      if error
        sAlert.error error.reason
      else
        sAlert.success "#{name} was successfully added."
      $('#create-line-item option:first').attr('selected', true)