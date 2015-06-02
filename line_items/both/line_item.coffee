class @LineItem extends TinyModel
  @collection: new Meteor.Collection('line_items')
  
  @field 'configuration_id'
  
  @field 'id'
  @field 'name'
  @field 'category_name'
  @field 'image_url'
  @field 'minimum_quantity'
  @field 'maximum_quantity'
  @field 'quantity'
  @field 'days_to_deploy'
  @field 'extended_deployment'
  @field 'associate_device'
  @field 'associated_devices'
  @field 'message_type_ids'
  @field 'status'
  @field 'messages'
  @field 'components'
  
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
    