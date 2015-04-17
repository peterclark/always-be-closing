Template.quote.helpers
  
  status: -> 
    status = []
    if this.locked
      status.push 'locked'
    status.join(' ')
    
Template.quotes.helpers

  quotes: ->
    Quote.find()

  totalCount: ->
    Quote.count()
    
  showMine: ->
    Session.get "showMine"