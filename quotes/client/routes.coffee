Router.route '/quotes', ->
  @.render 'quotes'
  
Router.route '/quotes/:_id', ->
  @.render 'show_quote',
    data: -> Quote.find( @.params._id )