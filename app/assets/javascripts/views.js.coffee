class Notifier.Views.MessageItem extends Backbone.Marionette.ItemView
  tagName: 'tr'
  className: 'message'
  template: 'message'

class Notifier.Views.Messages extends Backbone.Marionette.CompositeView
  template: 'messages'
  itemView: Notifier.Views.MessageItem
  itemViewContainer: 'tbody'
