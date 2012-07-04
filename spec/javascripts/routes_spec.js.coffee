describe "Notifier.Routers.Messages", ->
  beforeEach ->
    @controller = { index: null }
    spyOn(@controller, 'index')
    @router = new Notifier.Routers.Messages(controller: @controller)
    Backbone.history.start(silent: true, pushState: true)

  afterEach ->
    @router.navigate('jasmine', true)


  describe "/messages", ->
    it "calls MessagesController.index", ->
      @router.navigate('messages', true)
      expect(@controller.index).toHaveBeenCalled()


