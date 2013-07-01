#= require "foundation/jquery"

# Foundation Javascript
#= require "foundation/modernizr.foundation"
#= require "foundation/jquery.placeholder"
#= require "foundation/jquery.offcanvas"
#= require "foundation/jquery.cookie"
#= require "foundation/jquery.event.move"
#= require "foundation/jquery.event.swipe"
#= require "foundation/jquery.foundation.utils"
#= require "foundation/jquery.foundation.accordion"
#= require "foundation/jquery.foundation.alerts"
#= require "foundation/jquery.foundation.buttons"
#= require "foundation/jquery.foundation.clearing"
#= require "foundation/jquery.foundation.forms"
#= require "foundation/jquery.foundation.joyride"
#= require "foundation/jquery.foundation.magellan"
#= require "foundation/jquery.foundation.mediaQueryToggle"
#= require "foundation/jquery.foundation.navigation"
#= require "foundation/jquery.foundation.orbit"
#= require "foundation/jquery.foundation.reveal"
#= require "foundation/jquery.foundation.tabs"
#= require "foundation/jquery.foundation.tooltips"
#= require "foundation/jquery.foundation.topbar"
#= require "faker"

(($, window, undefined_) ->
  "use strict"
  $doc = $(document)
  Modernizr = window.Modernizr
  $(document).ready ->
    (if $.fn.foundationAlerts then $doc.foundationAlerts() else null)
    (if $.fn.foundationButtons then $doc.foundationButtons() else null)
    (if $.fn.foundationAccordion then $doc.foundationAccordion() else null)
    (if $.fn.foundationNavigation then $doc.foundationNavigation() else null)
    (if $.fn.foundationTopBar then $doc.foundationTopBar() else null)
    (if $.fn.foundationCustomForms then $doc.foundationCustomForms() else null)
    (if $.fn.foundationMediaQueryViewer then $doc.foundationMediaQueryViewer() else null)
    (if $.fn.foundationTabs then $doc.foundationTabs(callback: $.foundation.customForms.appendCustomMarkup) else null)
    (if $.fn.foundationTooltips then $doc.foundationTooltips() else null)
    (if $.fn.foundationMagellan then $doc.foundationMagellan() else null)
    (if $.fn.foundationClearing then $doc.foundationClearing() else null)
    (if $.fn.placeholder then $("input, textarea").placeholder() else null)

  
  # UNCOMMENT THE LINE YOU WANT BELOW IF YOU WANT IE8 SUPPORT AND ARE USING .block-grids
  # $('.block-grid.two-up>li:nth-child(2n+1)').css({clear: 'both'});
  # $('.block-grid.three-up>li:nth-child(3n+1)').css({clear: 'both'});
  # $('.block-grid.four-up>li:nth-child(4n+1)').css({clear: 'both'});
  # $('.block-grid.five-up>li:nth-child(5n+1)').css({clear: 'both'});
  
  # Hide address bar on mobile devices (except if #hash present, so we don't mess up deep linking).
  if Modernizr.touch and not window.location.hash
    $(window).load ->
      setTimeout (->
        window.scrollTo 0, 1
      ), 0

  $(".faker").text(Faker.Lorem.paragraphs(2))
  $(".faker2").text(Faker.Lorem.paragraphs(20))
  $("section.content").css("min-height", $(window).height() - 139 - $("header").height() - $("footer").height())

) jQuery, this

_gaq = _gaq || []
_gaq.push(['_setAccount', 'UA-21819111-3'])
_gaq.push(['_trackPageview'])

(() ->
  ga = document.createElement('script')
  ga.type = 'text/javascript'
  ga.async = true
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'
  s = document.getElementsByTagName('script')[0]
  s.parentNode.insertBefore(ga, s)
)()

