Router.route '/options/:_id',
  template: 'show_option',
  name: 'option',
  data: -> Option.findOne( _id: @.params._id )