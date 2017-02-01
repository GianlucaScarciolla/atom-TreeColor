utilites = require "./utilities.coffee"

class ColorFolder
  atom.deserializers.add this

  constructor: (@items = []) ->


  colorFolder: (item) ->
    dialog = document.createElement "div"
    dialog.setAttribute 'style', 'width:100%'

    lbl = document.createElement "div"
    lbl.setAttribute 'style', 'position:relative; float:left; margin-right:10px;' +
                              'font-weight:bold; font-size:12px; color:#ffffff'
    lbl.appendChild document.createTextNode 'Please enter your color:'
    dialog.appendChild lbl

    input = document.createElement 'input'
    input.setAttribute 'style', 'width:350px'
    input.classList.add 'native-key-bindings'
    dialog.appendChild input

    panel = atom.workspace.addModalPanel item: dialog
    input.focus()

    input.addEventListener 'keypress', (e) =>
      if e.which is 13
        item.style.backgroundColor = input.value
        panel.destroy()
        return false

  colorFolderCommand: ->
    item = utilites.getActiveSidebarElement()

    if item?
      @colorFolder item
      @items.push item

  uncolorFolder: ->
    for item in @items
      item.removeAttribute("style")
    @items = []

module.exports = ColorFolder
