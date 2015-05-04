Meteor.subscribe("configurations")

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