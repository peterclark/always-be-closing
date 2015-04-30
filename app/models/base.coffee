class @Base
  @collection: undefined
  @errors: false
  
  # class methods
  
  # Public: Find all documents that match the query and initialize.
  #
  # query       - selection criteria
  # projection  - fields to return
  #
  # Examples
  #
  #   Quote.find( id: 99, active: true )
  #   # => [Quote, Quote, Quote]
  #
  # Returns an array of objects
  @find: (query={}, projection={}) ->
    docs = @collection.find( query, projection ).fetch()
    docs = docs.map (doc) => new @( doc )
      
  @findOne: (query={}) ->
    doc = @collection.findOne( query )
    new @( doc )
    
  @insert: (params={}) ->
    doc = new @( params )
    doc.validate()
    @collection.insert( params ) unless doc.errors
    doc

  @remove: (query={}, justOne=false) ->
    @collection.remove( query, justOne )
        
  @count: (query={}) ->
    @collection.find( query ).count()
    
  @to_s: ->
    @collection._name
    
  # instance methods
  
  remove: ->
    @constructor.collection.remove( @_id )
      
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