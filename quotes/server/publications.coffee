Meteor.publish "quotes", ->
  Quote.find()