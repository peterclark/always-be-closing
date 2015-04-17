Meteor.methods

  createQuote: (name) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote = Quote.create
      user_id: Meteor.userId(),
      name: name,
      createdAt: new Date(),
      username: Meteor.user().username
  
  destroyQuote: (id) ->
    quote = Quote.find( id )
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote.destroy()