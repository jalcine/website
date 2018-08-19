//= require webfontloader/webfontloader.js
//= require picturefill/dist/picturefill.min.js
//= require _fonts.js
//= require _analytics.js

function stretchOutImages () {
  var images = document.querySelectorAll("img.x-bleed");
  images.forEach(function stretchImage(image) {
    var parentElement = image.parentElement;
    parentElement.style.maxWidth = "none";
    parentElement.style.margin = "0rem";
    parentElement.style.padding = "0rem";
    image.style.width = "100vw";
  });
};

window.addEventListener('load', function () {
  stretchOutImages();
  WebFont.load(WebFontConfig);
});
