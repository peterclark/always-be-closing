Meteor.publish "configurations", ->
  Configuration.find()