class @User
  @collection: Meteor.users
  
  constructor: (params) ->
    @username = params.username
    @_id = params._id
  
  # class methods
  
  @find: (conditions={}) ->
    User.collection.find conditions
    
  @findOne: (conditions={}) ->
    user = User.collection.findOne conditions
    new User( user ) if user
  
  @current: -> 
    new User(Meteor.user()) if Meteor.userId()
    
  @icon: ->
    'fa-users'
    
  @count: (conditions={}) ->
    @find(conditions).count()
    
  # instance methods
  
  quotes: ->
    Quote.find user_id: @_id
  
  icon: ->
    'fa-user'
  
  