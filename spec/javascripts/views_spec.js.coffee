describe "Notifier.Views.Messages", ->
  it "renders the 'messages' template", ->
    spyOn(JST, 'messages')
    view = new Notifier.Views.Messages()
    view.render()
    expect(JST['messages']).toHaveBeenCalled()

  it "creates an element for each message", ->
    collection = new Backbone.Collection()
    model1 = { stub_name: 'model1' }
    model2 = { stub_name: 'model2' }
    collection.reset([model1, model2])

    view = new Notifier.Views.Messages(collection: collection)
    view.render()

    message_elements = $(view.el).find('.message')
    expect(message_elements.length).toEqual collection.length




