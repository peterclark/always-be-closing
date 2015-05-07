Meteor.publish "line_items", ->
  LineItem.find()