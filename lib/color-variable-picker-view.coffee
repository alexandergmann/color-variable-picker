# Color Pickers View Class
# {View} = require 'atom'
convert = require './color-variable-picker-converter'

colorPicker = undefined
huePicker = undefined
alphaPicker = undefined
saturationPicker = undefined


module.exports =
class ColorVariablePickerView


  constructor: (serializedState) ->
    # (atom.workspaceView.find '.vertical').append this
    ColorPicker = require './color-variable-picker'
    # SaturationPicker = require './color-variable-picker-saturation'
    # ALphaPicker = require './color-variable-picker-alpha'
    HuePicker = require './color-variable-picker-hue'

    @element = document.createElement('div')
    @element.classList.add('colorpickmenu')
    @element.setAttribute 'id', 'colorpickmenu'


    # create + rend Hue element
    @hueElement = document.createElement('div')
    @hueElement.classList.add('cvp-huePickerElement')
    @hueElement.setAttribute 'id', 'cvp-huePickerElement'


    @hueChoiceEl = document.createElement('div')
    @hueChoiceEl.classList.add('cvp-hueChoice')
    @hueChoiceEl.setAttribute 'id', 'cvp-hueChoice'
    @hueElement.appendChild(@hueChoiceEl)


    #Create and render the canvas
    @huePickerCanvas = document.createElement('canvas')
    @huePickerCanvas.classList.add('cvp-huePicker')
    @huePickerCanvas.setAttribute 'id', 'cvp-huePicker'
    hueCanvasContext = @huePickerCanvas.getContext '2d'
    gradientHue = hueCanvasContext.createLinearGradient 0, 0, 1, 200
    gradientHue.addColorStop 0, 'rgb(255,   0,   0)'
    gradientHue.addColorStop 0.15, 'rgb(255,   0, 255)'
    gradientHue.addColorStop 0.33, 'rgb(0,     0, 255)'
    gradientHue.addColorStop 0.49, 'rgb(0,   255, 255)'
    gradientHue.addColorStop 0.67, 'rgb(0,   255,   0)'
    gradientHue.addColorStop 0.84, 'rgb(255, 255,   0)'
    gradientHue.addColorStop 1, 'rgb(255,   0,   0)'
    hueCanvasContext.fillStyle = gradientHue
    hueCanvasContext.fillRect 0, 0, 200, 200
    @hueElement.appendChild(@huePickerCanvas)

    @element.appendChild(@hueElement)


    # # create + rend alpha element
    # @alphaElement = document.createElement('div')
    # @alphaElement.classList.add('cvp-alphaPickerElement')
    # @alphaElement.setAttribute 'id', 'cvp-alphaPickerElement'
    #
    # @alphaChoice = document.createElement('div')
    # @alphaChoice.classList.add('cvp-alphaChoice')
    # @alphaChoice.setAttribute 'id', 'cvp-alphaChoice'
    # @alphaElement.appendChild(@alphaChoice)
    #
    # #Create and render the canvas
    # @alphaPickerCanvas = document.createElement('canvas')
    # @alphaPickerCanvas.classList.add('cvp-alphaPicker')
    # @alphaPickerCanvas.setAttribute 'id', 'cvp-alphaPicker'
    # alphaCanvasContext = @alphaPickerCanvas.getContext '2d'
    # gradientAlpha = alphaCanvasContext.createLinearGradient 0, 0, 1, 200
    # _gradient.addColorStop .01, 'hsl(0,100%,100%)'
    # _gradient.addColorStop .99, "hsl(#{ _hslArray[0] },100%,50%)"
    # gradientAlpha.addColorStop .01, 'rgba(0,0,0,0)'
    # gradientAlpha.addColorStop .99, 'rgba(0,0,0,1)'
    # alphaCanvasContext.fillStyle = gradientAlpha
    # alphaCanvasContext.fillRect 0, 0, 20, 200
    # @alphaElement.appendChild(@alphaPickerCanvas)
    # @element.appendChild(@alphaElement)


  destroy: ->
    @element.remove()

  show: ->
    colorPickerInfo.colorObject = convert.colorObject colorPickerInfo.selectedColorText

  getElement: ->
    @element


  # open: ->
  #   colorPickerInfo.colorObject = convert.colorObject colorPickerInfo.selectedColorText
  #
  #
  # close: ->
  #
  # bind: ->
  #
  #
  colorPickerInfo: {
    selectedColorText: null
    selectionBufferRange: null
    selectedColorObject: null
    }
  #
  # confirm: ->
  #   @insertColorToEditor selectedColor
  #   @hide()
  #
  # insertColorToEditor: ->
  #   editor = atom.workspace.getActiveTextEditor()
  #   editor.replaceSelectedText null, =>
  #     return @colorPickerInfo.selectedColorText




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
