var fs = require('fs-extra');
var mbgl = require('mapbox-gl-style-spec');
var checkFonts = require('./check-fonts');

var stylePath = 'style.json';
var styleString = fs.readFileSync(stylePath, 'utf8');
var style = JSON.parse(styleString);

var errors = mbgl.validate(style);
if(errors && errors.length) {
  console.error(
      'ERROR: The style is not valid according to mapbox-gl-style-spec.');
  console.error(errors);
  process.exit(1);
}

checkFonts(style);

var formattedStyleString = mbgl.format(style);
if(styleString.trim() !== formattedStyleString.trim()) {
  console.log(
    'WARNING: Style is not formatted. You should use "gl-style-format"\n' +
    'before commit. See https://github.com/mapbox/mapbox-gl-style-spec');
}

