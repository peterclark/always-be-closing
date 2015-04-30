class @Quote extends Base
  @collection: new Meteor.Collection('quotes')
  
  constructor: (params) ->
    @_id          = params._id
    @name         = params.name
    @description  = params.description
    @locked       = params.locked or false
    @username     = params.username
    @user_id      = params.user_id
  
  # class methods
  
  @icon: ->
    "fa-file-text"
    
  # @update: (query, update) ->
  #   Quote.collection.update query, update
  
  # instance methods
  
  insert: ->
  
  # update: (params) ->
  #   for key, val of params
  #     @[key] = val
  #   Quote.collection.update( { _id: @_id }, { $set: } 
  
  user: -> 
    User.findOne( _id: @user_id ) if @user_id
    
  options: ->
    options = Option.find(quote_id: @_id)
    options = options.map (o) -> new Option(o)
    
  mine: ->
    @user_id == Meteor.userId()
  
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Quote name is too short')
  
  icon: ->
    "fa-file-text"
    
  to_s: ->
    name: @name
    