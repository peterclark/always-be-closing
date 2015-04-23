Meteor.startup ->
  sAlert.config
    effect: 'stackslide',
    position: 'right-bottom',
    timeout: 10000
  
Accounts.ui.config
  passwordSignupFields: "USERNAME_ONLY"
