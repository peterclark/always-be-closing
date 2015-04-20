Router.route '/tasks', ->
  @.render 'tasks'
  
Router.route '/tasks/:_id', ->
  @.render 'show_task',
    data: -> Tasks.findOne( @.params._id )