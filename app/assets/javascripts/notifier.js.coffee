@Notifier = new Backbone.Marionette.Application

Notifier.module 'Models'
Notifier.module 'Collections'
Notifier.module 'Routers'
Notifier.module 'Controllers'
Notifier.module 'Views'

Notifier.addInitializer ->
  Notifier.addRegions(mainRegion: '#main')
  #controller = new Notifier.Controllers.Entries
  #new Notifier.Routers.Entries(controller: controller)
  #Backbone.history.start()

$(document).ready ->
  Notifier.start()
