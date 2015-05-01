class @Quote extends Base
  @collection: new Meteor.Collection('quotes')
  
  constructor: (params={}) ->
    @name         = params.name
    @description  = params.description
    @locked       = params.locked or false
    @username     = params.username
    @user_id      = params.user_id
  
  # class methods
  
  @icon: ->
    "fa-file-text"
  
  # instance methods
  
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Quote name is too short')
    
  user: -> 
    if @user_id
      user = User.findOne( _id: @user_id )
    
  options: ->
    options = Option.find(quote_id: @_id).fetch()
    
  mine: ->
    @user_id == Meteor.userId()
  
  icon: ->
    "fa-file-text"
    
  to_s: ->
    @name
    