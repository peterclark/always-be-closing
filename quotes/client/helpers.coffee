Template.quote.helpers
  
  status: -> 
    status = []
    if this.locked
      status.push 'locked'
    return status.join(' ')