class @Offering
  @collection: new Meteor.Collection("offerings")
      
  @all: ->
    @collection.find().fetch()
    
  @find: (selector={}) ->
    @collection.find(selector)
    
  @count: ->
    @collection.find().count()
      
  