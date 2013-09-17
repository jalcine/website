(function(){
  window.Bareburger = {};
  window.Bareburger.Map = function(mapElem, contextElem) {
    var map = null,
        locations = [],
        self = this,
        parentElem = mapElem.parent()
    ;

    /**
    * @fn fetchLocations
    *
    * Gets the locations available from a JSON file and invokes a callback
    * when the locations are obtained.
    */
    this.fetchLocations = function(callback){
      $.getJSON("locations.json", function(data) {
        console.log("Got " + data.length + " locations.");
        locations = data;
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
        attribution: "&copy; <a href='http://bareburger.com'>Bareburger</a> 2013",
      }).addTo(map);
    };

    this.bindElements = function(){
      contextElem.find("#return_to_map").on("click",function(){
        self.context.hide();
        self.markers.fitAll();
      });
    }

    this.build = function() {
      self.render();
      self.bindElements();
      self.bindEvents();
      self.addControls();
      map.locate({setView: true,enableHighAccuracy:true,maxZoom:15});
      map.on("locationfound",function(e){
        self.geocodeMarker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(map);
        self.geocodeMarker.bindPopup("You're around this area").openPopup();
        map.setView([e.latlng.lat,e.latlng.lng]);
        map.setZoom(14);
      });

      this.fetchLocations(function(){
        map.whenReady(function(){
          setTimeout(function(){
            self.markers.placeAll();
            self.markers.fitAll();
          }, 750);
        });
      });

      $(window).on("resize",function(){
        if (contextElem.css("opacity")) {
          contextElem.css("left", parentElem.width() * 0.7);
          contextElem.css("height", mapElem.height());
          contextElem.css("width", parentElem.width() * 0.3);
          mapElem.width(parentElem.width() * 0.7);
        } else {
          mapElem.width(parentElem.width());
        }
        mapElem.height(parentElem.height());
        map.invalidateSize(true);
      });
    }

    this.addControls = function() {
      this.geocodeMarker = null;
      geocode = new L.Control.GeoSearch({
        provider: new L.GeoSearch.Provider.Google(),
        position: "bottomleft",
        showMarker: false
      });
      geocode.addTo(map);
    }

    this.bindEvents = function() {
      map.on('geosearch_showlocation',function(e){
        self.geocodeMarker = L.marker([e.Location.Y, e.Location.X]).addTo(map);
        self.geocodeMarker.on("click", function(){
          self.markers.fitAll();
        });
        setTimeout(function(){
          map.setZoom(15);
        },100);
      });
    }

    this.context = {
      show : function(location) {
        // Zoom up the map to specified location.
        contextElem.attr("data-color", location.color);
        self.context.fill(location);

        contextElem.animate({
          height: mapElem.height(),
          width: parentElem.width() * 0.3,
          left: parentElem.width() * 0.7,
          opacity: 1
        },400);

        // Show sidebar info.
        mapElem.animate({
          width: parentElem.width() * 0.7
        },{
          duration: 400,
          step: function(){ map.invalidateSize(true); },
          done : function() {
            map.panTo([ location.lat, location.lng ], { animate: true })
            setTimeout(function(){map.setZoom(14, {animate: true})},300);
          }
        });

      },
      hide : function() {
        contextElem.animate({
          left: parentElem.width(), 
          opacity: 0
        }, 400);

        mapElem.animate({
          width: parentElem.width(),
        }, {
          duration: 400,
          step : function() {
            map.invalidateSize(true);
          },
          done: function(){
            contextElem.removeAttr("data-color");
            map.invalidateSize(true);
          }
        });
      },
      fill : function(data) {
        contextElem.find("#place_title").text(data.title);
        contextElem.find("#place_number").text(data.phone).attr("href","tel://" + data.phone);
        del = "";
        switch(data.delivers){
          case "yes":  del = "Delivery Available"; break;
          case "no":   del = "Delivery Not Available"; break;
          case "wait": del = "Delivery Coming Soon"; break;
        }
        contextElem.find("#delivery").attr("data-delivers",data.delivers)
        contextElem.find("#delivery").text(del);
        contextElem.find("img#brand").attr("src",data.image);
        contextElem.find("#directions_to_place").attr("href", "http://maps.google.com/?daddr=" + data.lat + ","+data.lng)
        contextElem.find("#hours").html("<li><i class='icon-time'></i>HOURS</li>");
        _.each(data.hours,function(currentHour){
          contextElem.find("#hours").append("<li>" + currentHour.start.day + " to " +
                             currentHour.end.day + " from " +
                             currentHour.start.hour + " to " +
                             currentHour.end.hour + "</li>");
        });
      }
    };

    this.markers = {
      placeAll : function() {
        i = 2;
        _.each(locations, function(loc){
          setTimeout(function(place){
            self.markers.add(place);
          }, 150 * (i++), loc);
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
          contextElem.find("#about").hide();
          this.bounce({duration: 300,height: 30});
          setTimeout(function(){
            self.context.show(location);
          },310);
        }).bounce({
          duration: 600,
          height: 70
        });
      },
      fitAll : function() {
        if (self.geocodeMarker){
          //self.geocodeMarker.remove();
        }
        bounds = []
        _.each(locations,function(loc){ bounds.push([loc.lat, loc.lng]); });
        map.whenReady(function(){
          map.fitBounds(bounds,{animate: true});
        }, map);
      }
    };
  };
})();

$(function(){
  // Resize elements according.
  var mapElem = $("#map")
  parentElem = mapElem.parent(),
  contextElem = parentElem.find("#context");

  mapElem.height(parentElem.height());
  mapElem.width(parentElem.width());
  contextElem.height(mapElem.height());

  // Get a map.
  var aMap = new Bareburger.Map(mapElem,contextElem);
  aMap.build();
});
