Meteor.startup ->
  if Offering.count() == 0
    url       = Meteor.settings.product_catalog.product_offerings_url
    headers   = Meteor.settings.product_catalog.headers
    response  = HTTP.get( url, headers )
    data      = JSON.parse(response.content)['response']
    Offering.collection.insert( doc ) for doc in data
    
Meteor.publish "offerings", ->
  Offering.find()