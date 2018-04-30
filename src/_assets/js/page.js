//= require webfontloader/webfontloader.js
//= require _fonts.js

// Do some tweaks on images.
function stretchOutImages () {
  var images = document.querySelectorAll("img.x-bleed");
  images.forEach(function stretchImage(image) {
    var parentElement = image.parentElement;
    parentElement.style.maxWidth = "none";
    parentElement.style.margin = "0rem";
    parentElement.style.padding = "0rem";
  });
};

(function () {
  WebFont.load(WebFontConfig);
  stretchOutImages();
})(document);

// vim: set ft=javascript.liquid :
