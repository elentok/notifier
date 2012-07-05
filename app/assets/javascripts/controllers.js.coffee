class Notifier.Routers.Messages extends Backbone.Marionette.AppRouter
  appRoutes:
    'messages': 'index'

class Notifier.Controllers.Messages
  constructor: ->
    @collection = new Notifier.Collections.Messages
    main = $('#main')
    window.data = main.data('messages')
    messages = main.data('messages')
    @collection.reset(messages)
    window.col = @collection
    main.removeData('messages')

  index: ->
    view = new Notifier.Views.Messages(collection: @collection)
    Notifier.mainRegion.show(view)



Notifier.addInitializer ->
  controller = new Notifier.Controllers.Messages
  new Notifier.Routers.Messages(controller: controller)
