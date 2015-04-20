Router.configure
  layoutTemplate: 'layout'

Router.route '/', ->
  @.render 'quotes'