module Jekyll
  module DetermineArchaic

    def determine_archaic(pageTime, numOfMonth)

      if pageTime == nil
        return
      end

      currentMonths = ( Time.now.year * 12) + ( Time.now.mon )
      articleMonths = ( pageTime.year * 12 ) + ( pageTime.mon )
      diffMonth     = currentMonths - articleMonths

      if diffMonth >= numOfMonth
        "<strong>This article is pretty old; the info may not be worthwhile.</strong>"
      else
        ""
      end

    end

  end
end

Liquid::Template.register_filter(Jekyll::DetermineArchaic)
