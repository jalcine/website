//= require webfontloader/webfontloader.js
//= require picturefill/dist/picturefill.min.js
//= require _fonts.js
//= require _analytics.js

function stretchOutImages () {
  var images = document.querySelectorAll("img.fill");
  images.forEach(function stretchImage(image) {
    var parentElement = image.parentElement;
    parentElement.style.maxWidth = "none";
    parentElement.style.margin = "0rem";
    parentElement.style.padding = "0rem";
  });
};

window.addEventListener('load', function () {
  stretchOutImages();
  WebFont.load(WebFontConfig);
});
