class @Base
  @collection: undefined
  @errors: false
  
  # constructor
  constructor: (params={}) ->
    @_id = params._id
    @created_at = params.created_at
    @updated_at = params.updated_at
  
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
  @find: (selector={}) ->
    docs = @collection.find( selector ).fetch()
    docs = docs.map (doc) => new @( doc )
      
  @findOne: (selector={}) ->
    doc = @collection.findOne( selector )
    new @( doc )
    
  @insert: (params={}) ->
    doc = new @( params )
    doc.validate()
    @collection.insert( params ) unless doc.errors
    doc

  @remove: (selector) ->
    @collection.remove( selector )
        
  @count: (selector={}) ->
    @collection.find( selector ).count()
    
  @to_s: ->
    @collection._name
    
  # instance methods
  
  insert: ->
    if @persisted()
      @update()
    else
      @updated_at = @created_at = new Date()
      @_id = @constructor.collection.insert( @attributes() )
      
  update: ->
    if @persisted()
      @updated_at = new Date()
      @constructor.collection.update( @_id, { $set: @attributes() } )
  
  remove: ->
    @constructor.collection.remove( @_id )
      
  persisted: ->
    @_id?
    
  attributes: ->
    own   = Object.getOwnPropertyNames( @ )
    props = _.pick( @, own )
    attrs = _.omit( props, '_id' )
    
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
    
    
    
    
    
    
    