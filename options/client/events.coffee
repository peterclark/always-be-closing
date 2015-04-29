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