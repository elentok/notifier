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


describe "Notifier.Views.MessageItem", ->
  it "renders the date as a fuzzy date (3 days ago)", ->
    date = new Date()
    date.setDate(date.getDate() - 3)
    model = new Backbone.Model(created_at: date)
    view = new Notifier.Views.MessageItem(model: model)
    view.render()
    expect($(view.el)).toHaveText(/3 days ago/)


