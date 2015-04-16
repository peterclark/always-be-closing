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

Template.tasks.helpers({
  tasks: function () {
    if (Session.get("hideCompleted")) {
      // If hide completed is checked, filter tasks
      return Tasks.find({checked: {$ne: true}}, {sort: {createdAt: -1}});
    } else {
      // Otherwise, return all of the tasks
      return Tasks.find({}, {sort: {createdAt: -1}});
    }
  },
  hideCompleted: function () {
    return Session.get("hideCompleted");
  },
  incompleteCount: function () {
    return Tasks.find({checked: {$ne: true}}).count();
  }
});