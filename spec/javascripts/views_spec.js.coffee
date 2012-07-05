describe "Notifier.Views.Messages", ->
  it "renders the 'messages' template with the given collection", ->
    spyOn(JST, 'messages')
    collection = Stub.collection()
    view = new Notifier.Views.Messages(collection: collection)
    view.render()
    expect(JST['messages']).toHaveBeenCalledWith(items: collection.items)
