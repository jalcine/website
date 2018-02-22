//= require webfontloader/webfontloader.js

// Configure WebFontLoader.
var WebFontConfig = {
  google: {
    families: [
      'Open+Sans:400,700,italic:latin', // Default page font
      'Merriweather:400,700:latin', // Default page font
      'Inconsolata:100,300,500,700,italic:latin', // Default page font
    ]
  }
};

// Do some tweaks on images.
function stretchOutImages () {
  var images = document.querySelectorAll("p > img[x-bleed]");
  images.forEach(function stretchImage(image) {
    var parentElement = image.parentElement;
    parentElement.style.maxWidth = "none";
  });
};

(function () {
  WebFont.load(WebFontConfig);
  stretchOutImages();
})(document);
