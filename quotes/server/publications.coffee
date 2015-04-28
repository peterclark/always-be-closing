Meteor.publish "quotes", ->
  Quote.collection.find()