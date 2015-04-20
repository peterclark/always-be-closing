Meteor.startup ->
  sAlert.config
    effect: 'stackslide',
    position: 'right-bottom',
    timeout: 0
  
Accounts.ui.config
  passwordSignupFields: "USERNAME_ONLY"
