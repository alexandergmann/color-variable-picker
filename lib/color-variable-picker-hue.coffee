module.exports =

  createElement: ->
    @element = document.createElement('div')
    @element.classList.add('cvp-huePickerElement')
    @element.setAttribute 'id', 'cvp-huePickerElement'

    hueChoiceEl = document.createElement('div')
    hueChoiceEl.classList.add('cvp-hueChoice')
    hueChoiceEl.setAttribute 'id', 'cvp-hueChoice'

    huePickerCanvas = document.createElement('canvas')
    huePickerCanvas.classList.add('cvp-huePicker')
    huePickerCanvas.setAttribute 'id', 'cvp-huePicker'

    @element.appendChild(hueChoiceEl)
    @element.appendChild(huePickerEl)

    return @element
