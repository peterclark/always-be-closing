class @Option
  @collection: new Meteor.Collection('options')
  
  constructor: (params) ->
    @name         = params.name || 'Option 1'
    @description  = params.description
    @primary      = params.primary || false
    @quote_id     = params.quote_id
    @errors       = false
  
  # class methods
  
  @icon: ->
    "fa-list-alt"
    
  @find: (conditions={}) ->
    Option.collection.find conditions
    
  @findOne: (conditions={}) ->
    Option.collection.findOne conditions
    
  @count: (conditions={}) ->
    @find(conditions).count()
    
  @insert: (params) ->
    Option.collection.insert params
    
  @remove: (params) ->
    Option.collection.remove params
  
  # instance methods
  
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Option name is too short')
      
  error: (field, message) ->
    @errors ||= []
    e = {}
    e[field] = message
    @errors.push e
      
  error_messages: ->
    msg = []
    for i in @errors
      for key, value of i
        msg.push value
    msg
    
  quote: ->
    Quote.findOne( _id: @quote_id ) if @quote_id
  
  icon: ->
    "fa-list-alt"
    