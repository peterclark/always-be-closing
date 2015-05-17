class @LineItem extends Base
  @collection: new Meteor.Collection('line_items')
  
  constructor: (params) ->
    for key,value of params
      @[key] = value
  
  # class methods
  
  @icon: ->
    "fa-tasks"
    
  @insert_from_specification: (params) ->
    doc = Offering.specification( params )
    doc['configuration_id'] = params.configuration_id
    LineItem.insert( doc )
  
  # instance methods
    
  validate: ->
    true
    
  configuration: ->
    if @configuration_id
      configuration = Configuration.findOne( _id: @configuration_id )
  
  icon: ->
    "fa-tasks"
    