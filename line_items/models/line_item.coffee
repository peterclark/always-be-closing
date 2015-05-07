class @LineItem extends Base
  @collection: new Meteor.Collection('line_items')
  
  constructor: (params) ->
    @name             = params.name
    @description      = params.description
    @configuration_id = params.configuration_id
  
  # class methods
  
  @icon: ->
    "fa-tasks"
  
  # instance methods
    
  validate: ->
    true
    
  configuration: ->
    if @configuration_id
      configuration = Option.findOne( _id: @configuration_id )
  
  icon: ->
    "fa-tasks"
    