class @User extends Base
  @collection: Meteor.users
  
  constructor: (params) ->
    @username = params.username
  
  # class methods
  
  @current: -> 
    new User(Meteor.user()) if Meteor.userId()
    
  @icon: ->
    'fa-users'
    
  # instance methods
  
  quotes: ->
    Quote.all( user_id: @_id )
  
  icon: ->
    'fa-user'
  
  