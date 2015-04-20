class @Quote extends Minimongoid
  @debug = true
  @_collection: new Meteor.Collection('quotes')
  
  @belongs_to: [
    { name: 'user' }
  ]
  
  # @embeds_many:  [
  #   { name: 'options' }
  # ]
  
  @defaults:
    description: ''
    locked: false
    username: ''
  
  # class methods
  
  @icon: ->
    "glyphicons-file"
    
  @mine: (user_id) ->
    @.where user_id: user_id
  
  # instance methods
  
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Quote name is too short')
      @error('length', 'Length is wrong')
      
  error_messages: ->
    msg = []
    for i in @errors
      for key, value of i
        msg.push value
    msg
  
  icon: ->
    "glyphicons-file"
    
  mine: ->
    @user_id == Meteor.userId()
    