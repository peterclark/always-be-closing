Meteor.methods

  createQuote: (params) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote = Quote.insert
      user_id: Meteor.userId(),
      name: params.name,
      createdAt: new Date(),
      username: Meteor.user().username
    if quote.has_errors()
      throw new Meteor.Error('invalid', quote.error_messages())
  
  destroyQuote: (id) ->
    quote = Quote.findOne( _id: id )
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized", "You do not own this quote.")
    quote.remove()