describe "Notifier.Routers.Messages", ->
  beforeEach ->
    @controller = { index: null }
    spyOn(@controller, 'index')
    @router = new Notifier.Routers.Messages(controller: @controller)
    # because Backbone.history can only run once
    try
      Backbone.history.start(silent: true, pushState: true)

  afterEach ->
    @router.navigate('jasmine', true)


  describe "/messages", ->
    it "calls Notifier.Controllers.Messages.index()", ->
      @router.navigate('messages', true)
      expect(@controller.index).toHaveBeenCalled()


describe "Notifier.Controllers.Messages", ->
  beforeEach -> @sandbox.attr('id', 'main')

  describe "#constructor", ->
    beforeEach ->
      @messages = [ { title: '123', body: '456' }, { title: 'abc', body: 'def' } ] 
      $('#main').data('messages', @messages)
      @controller = new Notifier.Controllers.Messages

    it "loads the messages from the 'messages' data attribute of #main", ->
      models = @controller.collection.models
      expect(models.length).toEqual(@messages.length)
      expect(models[0].get('title')).toEqual(@messages[0].title)

    it "removes the 'messages' data attribute", ->
      expect($('#main').data('messages')).not.toBeDefined()

  describe "#index", ->
    beforeEach ->
      @controller = new Notifier.Controllers.Messages
      spyOn(Notifier.mainRegion, 'show')

    it "creates a new Notifier.Views.Messages with the collection", ->
      spyOn(Notifier.Views, 'Messages')
      @controller.index()
      expect(Notifier.Views.Messages).
        toHaveBeenCalledWith(collection: @controller.collection)

    it "shows the view in the main region", ->
      spyOn(Notifier.Views, 'Messages')
      @controller.index()
      view = Notifier.Views.Messages.mostRecentCall.object
      expect(Notifier.mainRegion.show).toHaveBeenCalledWith(view)



