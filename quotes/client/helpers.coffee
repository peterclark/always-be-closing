Template.quote.helpers

  status: -> 
    status = []
    if @.locked
      status.push 'locked'
    if @.mine()
      status.push 'mine'
    status.join(' ')
    
Template.quotes.helpers

  quotes: ->
    if Session.get "showMine"
      Quote.mine Meteor.userId()
    else
      Quote.find()

  totalCount: ->
    Quote.count()
    
  showMine: ->
    Session.get "showMine"