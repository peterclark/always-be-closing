Template.quotes.events

  # only show my quotes
  "change .show-mine input": (e) ->
    Session.set("showMine", e.target.checked)
    
  # create a new quote when form submitted
  "submit .create-quote": (e) ->
    name = e.target.text.value
    params = { name: name }
    Meteor.call "createQuote", params, (error, result) ->
      sAlert.error( error.reason ) if error
    e.target.text.value = ""
    false

Template.quote.events
    
  # delete the quote
  "click .delete": (e) ->
    Meteor.call "destroyQuote", @._id, (error, result) ->
      sAlert.error( error.reason ) if error
    
Template.show_quote.events

  # add an option
  "click .create-option": (e) ->
    e.preventDefault()
    params = { quote_id: @._id }
    Meteor.call "createOption", params, (error, result) ->
      sAlert.error( error.reason ) if error
        
         