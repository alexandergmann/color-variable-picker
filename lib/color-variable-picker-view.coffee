# Color Pickers View Class
# {View} = require 'atom'
{View} = require 'atom-space-pen-views'
convert = require './color-variable-picker-converter'

colorPicker = undefined
huePicker = undefined
alphaPicker = undefined
saturationPicker = undefined


module.exports =
class ColorVariablePickerView extends View
  @content: ->
    cvp = 'cvp-'
    @div id: 'cvp', class: 'cvp', =>
      @div id: cvp + 'saturationPickerElement', class: cvp + 'saturationPickerElement', =>
        @div id: cvp + 'saturationChoice', class: cvp + 'saturationChoice'
        @canvas id: cvp + 'saturationPicker', class: cvp + 'saturationPicker', width: '200px', height: '200px'
      @div id: cvp + 'alphaPickerElement', class: cvp + 'alphaPickerElement', =>
        @div id: cvp + 'alphaChoice', class: cvp + 'alphaChoice'
        @canvas id: cvp + 'alphaPicker', class: cvp + 'alphaPicker', width: '20px', height: '200px'
      @div id: cvp + 'huePickerElement', class: cvp + 'huePickerElement', =>
        @div id: cvp + 'hueChoice', class: cvp + 'hueChoice'
        @canvas id: cvp + 'huePicker', class: cvp + 'huePicker', width: '20px', height: '200px'
    @div class: 'buttons', =>
      @a outlet: "buttonCancel", class: 'btn cancel', click: 'hide', "cancel"
      @a outlet: "buttonConfirm", class: 'btn btn-success confirm hidden', click: "confirm", "confirm"




  constructor: (serializedState) ->
    # (atom.workspaceView.find '.vertical').append this
    ColorPicker = require './color-variable-picker'
    SaturationPicker = require './color-variable-picker-saturation'
    ALphaPicker = require './color-variable-picker-alpha'
    HuePicker = require '/color-variable-picker-alpha'

  cancelled: ->
    @hide()


 show: ->
 toggle: ->
    editor = atom.workspace.getActiveTextEditor()
    selectedText = editor.getSelectedText()
    colorCheck = ColorConverter.isColor selectedText
    # Toggling now checks panel visibility,
    # and hides / shows rather than attaching to / detaching from the DOM.
    if @
    if @panel?.isVisible()
      @cancel()
    else
      if colorCheck()
        colorPickerInfo.selectedText
        @show()

  show: ->

  destroy: -> @detach()


  open: ->
    colorPickerInfo.colorObject = convert.colorObject colorPickerInfo.selectedColorText


  close: ->

  bind: ->


  colorPickerInfo: {
    selectedColorText: null
    selectionBufferRange: null
    selectedColorObject: null
    }

  confirm: ->
    @insertColorToEditor selectedColor
    @hide()

  insertColorToEditor: ->
    editor = atom.workspace.getActiveTextEditor()
    editor.replaceSelectedText null, =>
      return @colorPickerInfo.selectedColorText




  # constructor: (serializedState) ->
  #   # Create root element
  #   @element = document.createElement('div')
  #   @element.classList.add('color-variable-picker')
  #
  #   # Create message element
  #   message = document.createElement('div')
  #   message.textContent = "The ColorVariablePicker package is Alive! It's ALIVE!"
  #   message.classList.add('message')
  #   @element.appendChild(message)
  #
  # # Returns an object that can be retrieved when package is activated
  # serialize: ->
  #
  # # Tear down any state and detach
  # destroy: ->
  #   @element.remove()
  #
  # getElement: ->
  #   @element
