Meteor.methods

  createLineItem: (params) ->
    if Meteor.isClient
      LineItem.insert
        name: "generating...",
        configuration_id: params.configuration_id
    
    if Meteor.isServer
      Meteor._sleepForMs 5000
      if !Meteor.userId()
        throw new Meteor.Error("not-authorized")
      line_item = LineItem.insert_from_specification( params )
      if line_item.hasErrors()
        throw new Meteor.Error('invalid', line_item.errorMessages())
  
  destroyLineItem: (id) ->
    line_item = LineItem.findOne _id: id
    quote = line_item.configuration().option().quote()
    
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized", "You do not own this quote.")
    line_item.remove _id: line_item._id