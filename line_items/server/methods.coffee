Meteor.methods

  createLineItem: (params) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    configuration = Configuration.findOne _id: params.configuration_id
  
  destroyLineItem: (id) ->
    line_item = LineItem.findOne _id: id
    quote = line_item.configuration().option().quote()
    
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized", "You do not own this quote.")
    line_item.remove _id: line_item._id