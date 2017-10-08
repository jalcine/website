//= require webfontloader/webfontloader.js

// Configure WebFontLoader.
var WebFontConfig = {
  google: {
    families: [
      'Open+Sans:100,300,500,700,italic:latin', // Default page font
      'Alegreya:100,300,500,700,italic:latin' // Default page font
    ]
  }
};

(function () {
  WebFont.load(WebFontConfig);
})(document);
