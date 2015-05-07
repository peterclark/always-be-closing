Router.route '/configurations/:_id', ->
  @.render 'show_configuration',
    data: -> Configuration.findOne( _id: @.params._id )