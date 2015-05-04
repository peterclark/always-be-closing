Meteor.methods

  createConfiguration: (params) ->
    if !Meteor.userId()
      throw new Meteor.Error("not-authorized")
    option = Option.findOne _id: params.option_id
    count = option.configurations().length
    configuration = Configuration.insert
      name: Meteor.call('generate_name'),
      option_id: option._id
    if configuration.has_errors()
      throw new Meteor.Error('invalid', configuration.error_messages())
  
  destroyConfiguration: (id) ->
    configuration = Configuration.findOne _id: id
    quote = configuration.option().quote()
    
    if quote.user_id != Meteor.userId()
      throw new Meteor.Error("not-authorized", "You do not own this quote.")
    configuration.remove _id: configuration._id