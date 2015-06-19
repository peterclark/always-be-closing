Template.show_option.helpers

  configurations: (option) ->
    Configuration.find option_id: @_id
    
Template.option.helpers

  isPrimary: (option) ->
    if @primary then 'fa-star' else 'fa-star-o'