Meteor.methods

  createOption: (params) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote = Quote.findOne _id: params.quote_id
    count = quote.options().length
    option = Option.insert
      name: "Option #{count+1}"
      quote_id: quote.id
  
  destroyOption: (id) ->
    option = Option.findOne _id: id
    quote = options.quote()
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized", "You do not own this quote.")
    option.remove _id: option._id