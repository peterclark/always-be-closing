class @Configuration extends Base
  @collection: new Meteor.Collection('configurations')
  
  constructor: (params) ->
    @name         = params.name
    @description  = params.description
    @option_id    = params.option_id
  
  # class methods
  
  @icon: ->
    "fa-list"
  
  # instance methods
    
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Configuration name is too short')
    
  option: ->
    if @option_id
      option = Option.findOne( _id: @option_id )
  
  icon: ->
    "fa-list"
    