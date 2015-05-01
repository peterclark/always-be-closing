class @Option extends Base
  @collection: new Meteor.Collection('options')
  
  constructor: (params) ->
    @name         = params.name
    @description  = params.description
    @primary      = params.primary or false
    @quote_id     = params.quote_id
  
  # class methods
  
  @icon: ->
    "fa-list-alt"
  
  # instance methods
    
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Option name is too short')
    
  quote: ->
    if @quote_id
      quote = Quote.findOne( _id: @quote_id )
  
  icon: ->
    "fa-list-alt"
    