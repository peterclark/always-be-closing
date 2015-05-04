Meteor.subscribe("options")

# events that occur on option page
Template.option.events

  # delete the option
  "click .delete": (e) ->
    e.preventDefault()
    option = @
    Meteor.call "destroyOption", option._id, (error, result) ->
      if error
        sAlert.error error.reason
      else
        sAlert.success "Option '#{option.name}' was deleted."
        
Template.show_option.events

  # add an option
  "click .create-configuration": (e) ->
    e.preventDefault()
    params = { option_id: @._id }
    Meteor.call "createConfiguration", params, (error, result) ->
      sAlert.error( error.reason ) if error