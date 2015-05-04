Router.route '/options/:_id', ->
  @.render 'show_option',
    data: -> Option.findOne( _id: @.params._id )