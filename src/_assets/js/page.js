//= require webfontloader/webfontloader.js

// Configure WebFontLoader.
var WebFontConfig = {
  google: {
    families: [
      'Noto+Sans:400,700,italic:latin', // Default page font
      'Lora:400,700,italic:latin', // Default page font
      'Inconsolata:100,300,500,700,italic:latin', // Default page font
    ]
  }
};

(function () {
  WebFont.load(WebFontConfig);
})(document);
