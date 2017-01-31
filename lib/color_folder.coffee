utilites = require "./utilities.coffee"

class ColorFolder
  atom.deserializers.add this

  constructor: (@items = []) ->

  colorFolder: (item) ->
    item.classList.add "color-folder-red"

  colorFolderCommand: ->
    item = utilites.getActiveSidebarElement()

    if item?
      @colorFolder item
      @items.push item

  uncolorFolder: ->
    for item in @items
      item.classList.remove "color-folder-red"
    @items = []

module.exports = ColorFolder
