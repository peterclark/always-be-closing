# events that occur on option page
Template.option.events

  # delete the option
  "click .delete": (e) ->
    e.preventDefault()
    self = @
    Meteor.call "destroyOption", self.id, (error, result) ->
      if error
        sAlert.error error.reason
      else
        sAlert.success "Option '#{self.name}' was deleted."