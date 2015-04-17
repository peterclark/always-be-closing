Router.configure
  layoutTemplate: 'layout'

Router.route '/', ->
  @.render 'tasks'