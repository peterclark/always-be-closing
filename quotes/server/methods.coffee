Meteor.methods

  createQuote: (params) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote = Quote.create
      user_id: Meteor.userId(),
      name: params.name,
      createdAt: new Date(),
      username: Meteor.user().username
    if quote.errors
      throw new Meteor.Error('invalid', quote.error_messages())
  
  destroyQuote: (id) ->
    quote = Quote.find( id )
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote.destroy()