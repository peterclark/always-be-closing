class @Quote extends TinyModel
  @collection: new Meteor.Collection('quotes')
  
  constructor: (params={}) ->
    { @name, @description, @locked, @username, @user_id } = params
    
  @validates 'name', presence: true, length: { in: [5..15] }
  
  # class methods
  
  @icon: ->
    "fa-file-text"
  
  # instance methods
    
  user: -> 
    if @user_id
      user = User.findOne( _id: @user_id )
    
  options: ->
    options = Option.all(quote_id: @_id)
    
  mine: ->
    @user_id == Meteor.userId()
  
  icon: ->
    "fa-file-text"
    
  toString: ->
    @name
    