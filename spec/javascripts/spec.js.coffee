#= require application
#= require_tree .


beforeEach ->
  @sandbox = $('<div>').appendTo(document.body)

afterEach ->
  @sandbox.remove()
