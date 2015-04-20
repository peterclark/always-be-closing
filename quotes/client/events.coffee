Meteor.subscribe("quotes")

Template.quotes.events

  # only show my quotes
  "change .show-mine input": (e) ->
    Session.set("showMine", e.target.checked)
    
  # create a new quote when form submitted
  "submit .new-quote": (e) ->
    name = e.target.text.value
    params = { name: name }
    Meteor.call "createQuote", params, (error, result) ->
      console.log error
      sAlert.error error.reason.join(', ')
    e.target.text.value = ""
    false
    
  # delete the quote
  "click .delete": (e) ->
    Meteor.call("destroyQuote", @._id)