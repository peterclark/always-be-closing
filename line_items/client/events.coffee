Template.line_item.events

  # delete the option
  "click .delete": (e) ->
    e.preventDefault()
    lineItem = @
    Meteor.call "destroyLineItem", lineItem._id, (error, result) ->
      if error
        sAlert.error error.reason
      else
        sAlert.success "Line Item '#{lineItem.name}' was deleted."