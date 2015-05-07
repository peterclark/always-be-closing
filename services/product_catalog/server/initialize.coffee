Meteor.startup ->
  if Offering.count() == 0
    url = Meteor.settings.product_catalog.url
    headers   = { 'X-Auth-Token': Meteor.settings.product_catalog.auth_token }
    response  = HTTP.get( url, { headers: headers } )
    data      = JSON.parse(response.content)['response']
    Offering.collection.insert( doc ) for doc in data
    
Meteor.publish "offerings", ->
  Offering.find()