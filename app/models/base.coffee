class @Base
  @collection: undefined
  errors: []
  
  # constructor
  constructor: (params={}) ->
  
  # class methods
  
  @new: (doc={}) ->
    obj             = new @(doc)
    obj._id         = doc._id
    obj.created_at  = doc.created_at
    obj.updated_at  = doc.updated_at
    obj
  
  @find: (selector={}) ->
    options = {}
    options.transform = (doc) => @new( doc )
    @collection.find( selector, options )
    
  # Public: Find all documents that match the selector and initialize.
  #
  # selector    - selection criteria
  #
  # Examples
  #
  #   Quote.all( locked: true )
  #   # => [Quote, Quote, Quote]
  #
  # Returns an array of objects    
  @all: (selector={}) ->
    @find( selector ).fetch()
      
  @findOne: (selector={}) ->
    doc = @collection.findOne( selector )
    @new( doc ) if doc
    
  @insert: (params={}) ->
    doc = new @( params )
    doc.updated_at = doc.created_at = new Date()
    return doc unless doc.valid()
    doc._id = @collection.insert( doc )
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
      return false unless @valid()
      @updated_at = @created_at = new Date()
      @_id = @constructor.collection.insert( @attributes() )
      
  update: ->
    if @persisted()
      return false unless @valid()
      @updated_at = new Date()
      @constructor.collection.update( @_id, { $set: @attributes() } )
    else
      false
  
  remove: ->
    @constructor.collection.remove( @_id )
      
  persisted: ->
    @_id?
    
  validate: ->
    true
    
  valid: ->
    @errors = []
    @validate()
    @errors.length == 0
    
  attributes: ->
    own   = Object.getOwnPropertyNames( @ )
    props = _.pick( @, own )
    attrs = _.omit( props, '_id' )
    
  error: (field, message) ->
    @errors ||= []
    e = {}
    e[field] = message
    @errors.push e
    
  has_errors: ->
    @errors.length > 0
    
  error_messages: ->
    msg = []
    for i in @errors
      for key, value of i
        msg.push value
    msg.join(', ')
    
    
    
    
    
    
    