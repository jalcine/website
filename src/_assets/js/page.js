//= require webfontloader/webfontloader.js

// Configure WebFontLoader.
var WebFontConfig = {
  google: {
    families: [
      'Open+Sans:400,700,italic:latin', // Default page font
      'Slabo:400,700:latin', // Default page font
      'Megrim:400:latin', // Default page font
      'Inconsolata:100,300,500,700,italic:latin', // Default page font
    ]
  }
};

(function () {
  WebFont.load(WebFontConfig);
})(document);
