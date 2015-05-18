class @Configuration extends TinyModel
  @collection: new Meteor.Collection('configurations')
  
  constructor: (params={}) ->
    { @name, @description, @option_id } = params
  
  @validates 'name', presence: true, length: { in: [5..15] }
  
  # class methods
  
  @icon: ->
    "fa-list"
  
  # instance methods
    
  option: ->
    if @option_id
      option = Option.findOne( _id: @option_id )
      
  line_items: ->
    LineItem.all( configuration_id: @_id )
  
  icon: ->
    "fa-list"
    