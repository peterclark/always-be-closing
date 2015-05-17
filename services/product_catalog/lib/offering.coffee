class @Offering
  @collection: new Meteor.Collection("offerings")
      
  @all: ->
    @collection.find().fetch()
    
  @find: (selector={}) ->
    @collection.find(selector)
    
  @count: ->
    @collection.find().count()
    
  @specification: (params) ->  
    url       = Meteor.settings.product_catalog.specification_url + params.offering_id
    headers   = Meteor.settings.product_catalog.headers
    try
      response  = HTTP.get( url, headers )
      doc       = JSON.parse(response.content)['response']
    catch error
      reason = error.response.data.error
      throw new Meteor.Error("fail", reason)
    doc
      
  