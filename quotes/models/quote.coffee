class @Quote extends Minimongoid
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
  
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Quote name is too short.')
      
  error_message: ->
    msg = ''
    for i in @errors
      for key, value of i
        msg += "#{key} : #{value}"
    msg
  
  # class methods
  
  @icon: ->
    "glyphicons-file"
  
  # instance methods
  
  icon: ->
    "glyphicons-file"
    
  mine: ->
    @user_id == Meteor.userId()
    