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

function stretchOutIframes () {
  var frames = document.querySelectorAll("iframe");
  frames.forEach(function stretchImage(frame) {
    delete frame.height;
  });
}

window.addEventListener('load', function () {
  stretchOutImages();
  stretchOutIframes();
  WebFont.load(WebFontConfig);
});
