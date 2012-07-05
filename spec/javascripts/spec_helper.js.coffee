@Stub =

  # Stubs a backbone collection
  collection: (stub_name = 'collection-stub') ->
    return {
      stub_name: stub_name,
      on: -> # required for rendering,
      items: { stub_name: "#{stub_name}-items" },
      toJSON: -> @items
    }
  
