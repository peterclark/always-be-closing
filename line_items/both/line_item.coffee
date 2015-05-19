class @LineItem extends TinyModel
  @collection: new Meteor.Collection('line_items')
  
  constructor: (params={}) ->
    {
      @id, 
      @name,
      @category_name,
      @image_url,
      @minimum_quantity,
      @maximum_quantity,
      @quantity,
      @days_to_deploy,
      @extended_deployment,
      @associate_device,
      @associated_devices,
      @message_type_ids
      @configuration_id,
      @status,
      @messages,
      @components
    } = params
    
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
    