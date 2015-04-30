class @Option
  @collection: new Meteor.Collection('options')
  
  constructor: (params) ->
    @_id          = params._id
    @name         = params.name
    @description  = params.description
    @primary      = params.primary || false
    @quote_id     = params.quote_id
    @errors       = false
  
  # class methods
  
  @icon: ->
    "fa-list-alt"
    
  @find: (query={}) ->
    options = Option.collection.find( query ).fetch()
    options = options.map (o) -> new Option(o)
    
  @findOne: (query={}) ->
    option = Option.collection.findOne( query )
    new Option( option ) if option
    
  @count: (query={}) ->
    Option.collection.find( query ).count()
    
  @insert: (params) ->
    option = new Option(params)
    option.validate()
    unless option.errors
      Option.collection.insert params
    option
    
  @remove: (params) ->
    Option.collection.remove params
  
  # instance methods
  
  remove: ->
    Option.collection.remove _id: @_id
  
  quote: ->
    if @quote_id
      quote = Quote.findOne( _id: @quote_id )
      new Quote(quote)
  
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
    msg.join(', ')
    
  quote: ->
    Quote.findOne( _id: @quote_id ) if @quote_id
  
  icon: ->
    "fa-list-alt"
    