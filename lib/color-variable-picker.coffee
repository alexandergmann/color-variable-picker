{CompositeDisposable} = require 'atom'
ColorVariablePickerView = require './color-variable-picker-view'
ColorConverter = require './color-variable-picker-converter'

module.exports = ColorVariablePicker =
  colorVariablePickerView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @colorVariablePickerView = new ColorVariablePickerView(state.colorVariablePickerViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @colorVariablePickerView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'color-variable-picker:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @colorVariablePickerView.destroy()

  serialize: ->
    colorVariablePickerViewState: @colorVariablePickerView.serialize()

  toggle: ->
    # if @modalPanel.isVisible()
    #   @modalPanel.hide()
    # else
    #   @modalPanel.show()
