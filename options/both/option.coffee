class @Option extends TinyModel
  @collection: new Meteor.Collection('options')
  
  constructor: (params={}) ->
    { @name, @description, @primary, @quote_id } = params
    
  @validates 'name', presence: true, length: { in: [5..15] }
  
  # class methods
  
  @icon: ->
    "fa-list-alt"
  
  # instance methods
    
  quote: ->
    if @quote_id
      quote = Quote.findOne( _id: @quote_id )
      
  configurations: ->
    Configuration.all( option_id: @_id )
  
  icon: ->
    "fa-list-alt"
    