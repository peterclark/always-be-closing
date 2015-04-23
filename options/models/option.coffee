class @Option extends Minimongoid
  
  @embedded_in: 'quote'
  
  @defaults:
    name: 'Option 1'
    description: ''
    primary: false
  
  # class methods
  
  @icon: ->
    "fa-list-alt"
  
  # instance methods
  
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Option name is too short')
      
  error_messages: ->
    msg = []
    for i in @errors
      for key, value of i
        msg.push value
    msg
  
  icon: ->
    "fa-list-alt"
    