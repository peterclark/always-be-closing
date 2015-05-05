Meteor.methods

  createOption: (params) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote = Quote.findOne _id: params.quote_id
    option = Option.insert
      name: Meteor.call('generateName'),
      quote_id: quote._id
    if option.hasErrors()
      throw new Meteor.Error('invalid', option.errorMessages())
  
  destroyOption: (id) ->
    option = Option.findOne _id: id
    quote = option.quote()
    
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized", "You do not own this quote.")
    option.remove _id: option._id