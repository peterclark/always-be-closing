Meteor.publish "options", ->
  Option.find()