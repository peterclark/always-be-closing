class @Quote extends TinyModel
  @collection: new Meteor.Collection('quotes')
  
  @field 'name'
  @field 'description'
  @field 'locked', default: false
  @field 'username'
  @field 'user_id'
    
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
    