Template.task.helpers({
  isOwner: function () {
    return this.owner === Meteor.userId();
  },
  status: function() {
    var classes = [];
    if(this.checked) {
      classes.push('checked')
    }
    if(this.private) {
      classes.push('private')
    }
    return classes.join(' ');
  }
});