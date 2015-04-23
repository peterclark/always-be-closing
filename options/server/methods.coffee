Meteor.methods

  createOption: (params) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    quote = Quote.first params.quote_id
    count = quote.options.length
    quote.push options: { name: "Option #{count+1}", _id: new Meteor.Collection.ObjectID()._str }
  
  destroyOption: (params) ->
    quote = Quote.first( params.quote_id )
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized", "You do not own this quote.")
    Quote._collection.update { _id: quote.id }, { $pull: { options: { _id: params.id }}}