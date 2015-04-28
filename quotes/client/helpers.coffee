Template.quote.helpers

  mine: ->
    @user_id == Meteor.userId()

  status: -> 
    status = []
    if @locked
      status.push 'locked'
    if @mine()
      status.push 'mine'
    status.join(' ')
    
Template.quotes.helpers

  quotes: ->
    if Session.get "showMine"
      Quote.find user_id: Meteor.userId()
    else
      Quote.find()

  totalCount: ->
    Quote.count()
    
  showMine: ->
    Session.get "showMine"
    
Template.show_quote.helpers

  options: (quote) ->
    Option.find quote_id: @.id