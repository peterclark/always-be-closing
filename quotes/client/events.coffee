Meteor.subscribe("quotes")

Template.quote.events
  "click .quote": ->
    alert 'hi'