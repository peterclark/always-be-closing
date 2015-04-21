class @User extends Minimongoid
  
  @_collection: Meteor.users
    
  @has_many: [
    { name: 'quotes', foreign_key: 'user_id' }
  ]
  
  # class methods
  
  @current: -> 
    User.init(Meteor.user()) if Meteor.userId()
    
  @icon: ->
    'fa-users'
    
  # instance methods
  
  icon: ->
    'fa-user'
  
  