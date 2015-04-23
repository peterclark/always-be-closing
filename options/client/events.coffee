# events that occur on options listing page
Template.options.events

# events that occur on option page
Template.option.events

  # delete the option
  "click .delete": (e) ->
    e.preventDefault()
    self = @
    params = { quote_id: @.quote.id, id: @.id }
    Meteor.call "destroyOption", params, (error, result) ->
      if error
        sAlert.error error.reason
      else
        console.log self.name
        sAlert.success "Option '#{self.name}' was deleted."