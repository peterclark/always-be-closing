class @Quote
  @collection: new Meteor.Collection('quotes')
  
  constructor: (params) ->
    @_id          = params._id
    @name         = params.name
    @description  = params.description
    @locked       = params.locked or false
    @username     = params.username
    @user_id      = params.user_id
    @errors       = false
  
  # class methods
  
  @icon: ->
    "fa-file-text"
    
  @find: (query={}) ->
    quotes = Quote.collection.find( query ).fetch()
    quotes = quotes.map (q) -> new Quote(q)
    
  @findOne: (query={}) ->
    quote = Quote.collection.findOne( query )
    new Quote( quote ) if quote
    
  @count: (query={}) ->
    Quote.collection.find( query ).count()
    
  @insert: (params) ->
    quote = new Quote(params)
    quote.validate()
    unless quote.errors
      Quote.collection.insert params
    quote
    
  # @update: (query, update) ->
  #   Quote.collection.update query, update
    
  @remove: (query) ->
    Quote.collection.remove query
  
  # instance methods
  
  insert: ->
  
  # update: (params) ->
  #   for key, val of params
  #     @[key] = val
  #   Quote.collection.update( { _id: @_id }, { $set: } 
  
  remove: ->
    Quote.collection.remove _id: @_id
  
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
  
  icon: ->
    "fa-file-text"
    
  to_s: ->
    name: @name
    