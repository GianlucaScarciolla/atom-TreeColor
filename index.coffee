ColorFolder = require "./lib/color_folder.coffee"

module.exports =
  activate: (state) ->
    @colorFolder = new ColorFolder()
    atom.commands.add "atom-workspace", "treecolor:color-folder",
                               @colorFolder.colorFolderCommand.bind @colorFolder

    atom.commands.add "atom-workspace", "treecolor:uncolor-folder",
                               @colorFolder.uncolorFolderCommand.bind @colorFolder
