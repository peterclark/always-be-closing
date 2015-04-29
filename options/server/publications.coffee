Meteor.publish "options", ->
  Option.collection.find()