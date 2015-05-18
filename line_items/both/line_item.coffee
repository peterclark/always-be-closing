class @LineItem extends TinyModel
  @collection: new Meteor.Collection('line_items')
  
  constructor: (params={}) ->
    { @name, @configuration_id, @status, @components } = params
    
  # class methods
  
  @icon: ->
    "fa-tasks"
    
  @insert_from_specification: (params) ->
    doc = Offering.specification( params )
    doc['configuration_id'] = params.configuration_id
    LineItem.insert( doc )
  
  # instance methods
    
  configuration: ->
    if @configuration_id
      configuration = Configuration.findOne( _id: @configuration_id )
  
  icon: ->
    "fa-tasks"
    