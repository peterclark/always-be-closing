class @Configuration extends TinyModel
  @collection: new Meteor.Collection('configurations')
  
  @field 'name'
  @field 'description'
  @field 'option_id'
  
  @validates 'name', presence: true, length: { in: [3..30] }
  
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
    