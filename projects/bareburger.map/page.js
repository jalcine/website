window.Bareburger = {};
window.Bareburger.Map = function() {
  var map = null, locations = [], self = this;

  /**
  * @fn fetchLocations
  *
  * Gets the locations available from a JSON file and invokes a callback
  * when the locations are obtained.
  */
  this.fetchLocations = function(callback){
    if (callback === null || callback === undefined) callback = function(){};

    $.getJSON("http://jalcine.me/projects/bareburger.map/locations.json", function(e){
      callback();
    });
  };

  /**
  * Creates the Leaflet map and the necessary initial components.
  */
  this.render = function() {
    map = L.map("map", {
      zoom : 11,
      center: [ 40.7143528, -74.00597309999999 ]
    });

    L.tileLayer("http://{s}.tile.cloudmade.com/ddac1a378966452591adc2782bf07771/997/256/{z}/{x}/{y}.png", {
      attribution: "&copy; <a href='http://jalcine.me'>Jacky Alcin&#233;</a> 2013",
    }).addTo(map);
  };

  this.bindElements = function(){
    $("#return_to_map").on("click",function(){
      self.context.hide();
      self.fitAllLocations();
    });

    $("#hide_about").one("click", function(){
      $("#about").fadeOut("slow");
    });
  }

  this.build = function() {
    self.render();
    self.bindElements();

    this.fetchLocations(function(){
      map.whenReady(function(){
        setTimeout(function(){
          $("#about").animate({opacity:1},function(){document.body.scrollTop=0});
          setTimeout(function(){$("#about").animate({top:"6em",borderTopLeftRadius:0,borderTopRightRadius:0,paddingTop:0,paddingBottom:0})},3000);
          self.markers.placeAll();
          self.markers.fitAll();
        }, 750);
      });
    });
  }

  this.context = {
    show : function(location) {
      // Zoom up the map to specified location.
      $("#context").attr("data-color", location.color);
      self.context.fill(location);

      // Show sidebar info.
      $("#map").animate({
        width: $("#body").width() * 0.7
      },{
        duration: 400,
        step: function(){ map.invalidateSize(true); },
        done : function() {
          map.panTo([ location.lat, location.lng ], { animate: true })
          setTimeout(function(){map.setZoom(14, {animate: true})},300);
        }
      });

      $("#context").animate({
        left: "60%",
        display: "inline-block",
        width: $("#body").width() * 0.3,
        opacity: 1,
      },400);
    },
    hide : function() {
      $("#context").animate({
        left: "100%",
      }, 400);

      $("#map").animate({
        width: $("#body").width(),
      }, {
        duration: 400,
        step : function() {
          map.invalidateSize(true);
        },
        done: function(){
          $("#context").removeAttr("data-color");
          map.invalidateSize(true);
        }
      });
    },
    fill : function(data) {
      $("#place_title").text(data.title);
      $("#place_number").text(data.phone);
      del="";
      switch(data.delivers){
        case "yes":  del = "Delivery Available"; break;
        case "no":   del = "Delivery Not Available"; break;
        case "wait": del = "Delivery Coming Soon"; break;
      }
      $("#delivery").attr("data-delivers",data.delivers)
      $("#delivery").text(del);
      $("img#brand").attr("src",data.image);
      $("#hours").html("<li><i class='icon-time'></i>HOURS</li>");
      _.each(data.hours,function(currentHour){
        $("#hours").append("<li>" + currentHour.start.day + " to " +
                           currentHour.end.day + " from " +
                           currentHour.start.hour + " to " +
                           currentHour.end.hour + "</li>");
      });
    }
  };


  this.markers = {
    placeAll : function() {
      _.each(locations, function(loc){
        setTimeout(function(place){
          self.placeMarker(place);
        }, 125 * (i + 1), loc);
      });
    },
    add : function(location) {
      icon = L.AwesomeMarkers.icon({
        icon: "food",
        color: location.color
      });

      marker = L.marker([location.lat,location.lng],{
        icon: icon,
        riseOnHover: true,
        title : location.title,
        opacity: 0.85
      }).addTo(map).on("click", function(e) {
        $("#about").hide();
        this.bounce({duration: 300,height: 30});
        setTimeout(function(){
          BareburgerMap.showContext(location);
        },310);
      }).bounce({
        duration: 500,
        height: 100
      });
    },
    fitAll : function() {
      bounds = []
      _.each(locations,function(location){
        bounds.push([location.lat, location.lng]);
      });

      map.whenReady(function(){
        map.fitBounds(bounds,{animate: true});
      }, map);
    }
  };
};

$(function(){
  // Resize the window.
  $("#map").height($("#body").height() - $("header").height());
  $("#map").width($("#body").width());
  $("#context").height($("#body").height() - $("header").height());

  // Get a map.
  aMap = new Bareburger.Map();
  aMap.build();
});
