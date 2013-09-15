(function(){
  window.BareburgerMap = {
    map : null,
    locations : [],
    getLocations : function() {
      // TODO: Read locations from a remote URL.
      this.locations = [
        {
        lat: 40.777772,
        lng: -73.94909299999999,
        color: "blue",
        title: "1681 1st Avenue",
        phone: "212-390-1344",
        delivers: "wait",
        image: "images/1681.jpg",
        hours : [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "10 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "11 PM "}}
        ]
      },
      {
        lat: 40.760558,
        lng: -73.990357,
        color: "blue",
        title: "366 West 46st Street",
        phone: "212-673-BARE (2273)",
        delivers: "no",
        image: "images/366.jpg",
        hours : [
          { start: { day : "SUN", hour: "11 AM"},
            end: { day: "THU", hour: "11 PM"}},
            { start: { day: "FRI", hour: "11 AM"},
              end: { day : "SAT", hour: "12 AM"}}
        ]
      },
      {
        lat: 40.6891931,
        lng: -73.9925868,
        color: "red",
        title: "149 Court St",
        phone: "347-529-6673",
        delivers: "yes",
        image: "images/149.jpg",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "10 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "11 PM "}}
        ]
      },
      {
        lat: 40.7874913,
        lng: -73.72830350000001,
        color: "green",
        title: "32 Middle Neck Road",
        phone: "516-441-5711",
        delivers: "wait",
        image: "images/32.jpg",
        hours: [
          { start: { day: "SUN", hour: "12 PM" },
            end :  { day: "FRI", hour: "10 PM" }},
            { start: { day: "SAT", hour: "12 PM" },
              end:   { day: "SAT", hour: "11 PM "}}
        ]
      },
      {
        lat: 40.74203929999999,
        lng: -74.00088020000001,
        color: "blue",
        title: "153 8th Avenue",
        phone: "212-414-BARE (2273)",
        delivers: "yes",
        image: "images/153.jpg",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "10 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "11 PM "}}
        ]
      },
      {
        lat: 40.7632858,
        lng: -73.92121159999999,
        color: "orange",
        title: "33-21 31st Avenue",
        phone: "718-777-7011",
        delivers: "yes",
        image: "images/33-21.jpg",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "11 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "FRI", hour: "midnight" }},
              { start: { day: "SAT", hour: "11 AM" },
                end:   { day: "SAT", hour: "midnight" }}
        ]
      },
      {
        lat: 40.728341,
        lng: -73.9987076,
        color: "blue",
        title: "535 LaGuardia Place",
        phone: "212-477-8125",
        delivers: "yes",
        image: "images/535.jpg",
        hours: [
          { start: { day: "EACH DAY", hour: "11 AM" },
            end:   { day: "EACH DAY", hour: "11 PM" }}
        ]
      },
      {
        lat: 40.746153,
        lng: -73.978135,
        color: "blue",
        title: "514 3rd Avenue",
        phone: "212-679-BARE (2273)",
        delivers: "yes",
        image: "images/514.jpg",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "11 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "midnight "}}
        ]
      },
      {
        lat: 40.719741,
        lng: -73.84298799999999,
        color: "orange",
        title: "71-49 Austin Street",
        phone: "718-ASK-BARE (275-2273)",
        image: "images/71-49.jpg",
        delivers: "yes",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "11 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "midnight "}}
        ]
      },
      {
        lat: 40.761713,
        lng: -73.77038,
        color: "orange",
        title: "42-38 Bell Boulevard",
        phone: "718-273-BARE (2273)",
        image: "images/42-38.jpg",
        delivers: "yes",
        hours: [
          { start: { day: "SUN", hour: "12 PM" },
            end :  { day: "WED", hour: "10 PM" }},
            { start: { day: "THU", hour: "12 PM" },
              end:   { day: "SAT", hour: "11 PM"}}
        ]
      },
      {
        lat: 40.671931,
        lng: -73.977738,
        color: "red",
        title: "170 7th Avenue",
        phone: "718-768-BARE (2273)",
        delivers: "yes",
        image: "images/170.jpg",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "10 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "11 PM "}}
        ]
      },
      {
        lat: 40.7684629,
        lng: -73.95513199999999,
        color: "blue",
        title: "1370 1st Avenue",
        phone: "212-510-8559",
        delivers: "wait",
        image: "images/1370.jpg",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "11 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "midnight "}}
        ]
      },
      {
        lat: 40.726804,
        lng: -73.98931999999999,
        color: "blue",
        title: "85 2nd Ave",
        phone: "212-510-8610",
        delivers: "yes",
        image: "images/85.jpg",
        hours: [
          { start: { day: "SUN", hour: "11 AM" },
            end :  { day: "THU", hour: "11 PM" }},
            { start: { day: "FRI", hour: "11 AM" },
              end:   { day: "SAT", hour: "midnight "}}
        ]
      },
      {
        lat: 40.774038,
        lng: -73.912761,
        color: "orange",
        title: "23-01 31st Street",
        phone: "718-204-7167",
        delivers: "yes",
        image: "images/23-01.jpg",
        hours: [
          { start: { day: "EACH DAY", hour: "11 AM" },
            end:   { day: "EACH DAY", hour: "11 PM" }}
        ]
      }
      ]
    },
    renderMap : function() {
      // Build the map.
      this.map = L.map("map", {
        zoom: 11,
        center: [ 40.7143528, -74.00597309999999 ]
      });

      // Render the tile layer.
      L.tileLayer("http://{s}.tile.cloudmade.com/ddac1a378966452591adc2782bf07771/997/256/{z}/{x}/{y}.png", {
        attribution: "&copy; <a href='http://jalcine.me'>Jacky Alcin&#233;</a> 2013",
      }).addTo(this.map);
    },

    putPlacemarkers : function() {
      console.log("Found " + this.locations.length + " locations.");
      for (i = 0; i < this.locations.length; i++){
        setTimeout(function(place){
          BareburgerMap.addMarker(place);
        }, 125 * (i + 1), this.locations[i]);
      }
    },

    showContext : function(location){
      // Zoom up the map to specified location.
      $("#context").attr("data-color", location.color);
      BareburgerMap.presentData(location);

      // Show sidebar info.
      $("#map").animate({
        width: $("#body").width() * 0.7
      },{
        duration: 400,
        step: function(){ BareburgerMap.map.invalidateSize(true); },
        done : function() {
          BareburgerMap.map.panTo([ location.lat, location.lng ], { animate: true })
          setTimeout(function(){BareburgerMap.map.setZoom(14, {animate: true})},300);
        }
      });

      $("#context").animate({
        left: "60%",
        display: "inline-block",
        width: $("#body").width() * 0.3,
        opacity: 1,
      },400,function(){
      })
    },

    hideContext : function() {
      $("#context").animate({
        left: "100%",
      }, 400);

      $("#map").animate({
        width: $("#body").width(),
      }, {
        duration: 400,
        step : function() {
          BareburgerMap.map.invalidateSize(true);
        },
        done: function(){
          $("#context").removeAttr("data-color");
          BareburgerMap.map.invalidateSize(true);
        }
      });
    },

    presentData : function(data) {
      $("#place_title").text(data.title);
      $("#place_number").text(data.phone);
      del="";
      switch(data.delivers){
        case "yes": del = "Delivery Available"; break;
        case "no":  del = "Delivery Not Available"; break;
        case "wait": del = "Delivery Coming Soon"; break;
      }
      $("#delivery").attr("data-delivers",data.delivers)
      $("#delivery").text(del);
      $("img#brand").attr("src",data.image);
      $("#hours").html("<li><i class='icon-time'></i>HOURS</li>");
      for(i = 0; i < data.hours.length; i ++){
        currentHour = data.hours[i];
        $("#hours").append("<li>" + currentHour.start.day + " to " +
                           currentHour.end.day + " from " +
                           currentHour.start.hour + " to " +
                           currentHour.end.hour + "</li>");
      }
    },

    bindElements : function() {
      $("#return_to_map").on("click",function(){
        BareburgerMap.hideContext();
        BareburgerMap.fitAllLocations();
      });

      $("#hide_about").on("click", function(){
        $("#about").fadeOut();
      });
    },

    fitAllLocations : function() {
      bounds = []
      for (i = 0; i < this.locations.length; i++){
        bounds.push([this.locations[i].lat, this.locations[i].lng]);
      }

      this.map.whenReady(function(){
        this.fitBounds(bounds,{animate: true});
      }, this.map);
    },

    addMarker : function(location) {
      icon = L.AwesomeMarkers.icon({
        icon: "food",
        color: location.color
      });

      marker = L.marker([location.lat,location.lng],{
        icon: icon,
        riseOnHover: true,
        title : location.title,
        opacity: 0.85
      }).addTo(this.map).on("click", function(e) {
        $("#about").hide();
        this.bounce({duration: 300,height: 30});
        setTimeout(function(){
          BareburgerMap.showContext(location);
        },310);
      }).bounce({
        duration: 500,
        height: 100
      });
    }
  }

  $(function(){
    // Resize the window.
    $("#map").height($("#body").height() - $("header").height());
    $("#map").width($("#body").width());
    $("#context").height($("#body").height() - $("header").height());

    // Activate the man.
    BareburgerMap.renderMap();

    // Grab the locations.
    BareburgerMap.getLocations();

    // Bind elements
    BareburgerMap.bindElements();

    // Show the spots.
    BareburgerMap.map.whenReady(function(){
      setTimeout(function(){
        $("#about").animate({opacity:1},function(){document.body.scrollTop=0});
        setTimeout(function(){$("#about").animate({top:"6em",borderTopLeftRadius:0,borderTopRightRadius:0,paddingTop:0,paddingBottom:0})},3000);
        BareburgerMap.putPlacemarkers();
        BareburgerMap.fitAllLocations();
      }, 750);
    });
  });
})();
