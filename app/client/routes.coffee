Router.route '/', ->
  @.layout 'layout'
  @.render 'tasks'