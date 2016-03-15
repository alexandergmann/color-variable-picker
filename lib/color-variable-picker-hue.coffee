module.exports =
  activate: ->
    @el = document.getElementById('cvp-colorElements')
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
    gradient = hueCanvasContext.createLinearGradient 0, 0, 1, 200
    gradient.addColorStop 0, 'rgb(255,   0,   0)'
    gradient.addColorStop 0.15, 'rgb(255,   0, 255)'
    gradient.addColorStop 0.33, 'rgb(0,     0, 255)'
    gradient.addColorStop 0.49, 'rgb(0,   255, 255)'
    gradient.addColorStop 0.67, 'rgb(0,   255,   0)'
    gradient.addColorStop 0.84, 'rgb(255, 255,   0)'
    gradient.addColorStop 1, 'rgb(255,   0,   0)'
    hueCanvasContext.fillStyle = gradient
    hueCanvasContext.fillRect 0, 0, 20, 200
    @hueElement.appendChild(@huePickerCanvas)

    #return the full hue element
    @el.appendChild(@hueElement)
    return this
