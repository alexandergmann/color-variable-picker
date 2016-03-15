oneColor = require 'onecolor'


module.exports =

  isColor: (string) ->
    newColor = oneColor(string)
    if newColor not instanceof onecolor.RGB and
       newColor not instanceof onecolor.HSL and
       newColor not instanceof onecolor.HSV
        return false
    else
      return true


  colorObject: (string) ->
    return oneColor(string)

  # hex to rgb
  hexToRgb: (color) ->
    color = oneColor(hex)
    return color.rgb()

  # hex to hsl
  hexToHsl: (hex) ->
    color = oneColor(hex)
    return color.hsl()


  # rgb to hex
  rgbToHex: (rgb) ->
    color = oneColor(rgb)
    return color.hexString()

  # rgb to hsl
  rgbToHsl: (rgb) ->
    color = oneColor(rgb)
    return color.hsl()


  # rgb to hsv
  rgbToHsv: (rgb) ->
    color = oneColor(rgb)
    return color.hsv
