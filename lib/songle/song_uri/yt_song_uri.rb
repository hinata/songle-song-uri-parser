# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class YtSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    SOURCE_HOST = "www.youtube.com"

    ##
    # @constant
    #
    SOURCE_PATH = "/watch?v="

    ##
    # @constant
    #
    TYPE = "youtube"

    ##
    # @constant
    #
    URI_REGEX = /#{ SOURCE_HOST.gsub("www.", "") }(#{ SOURCE_PATH.gsub("?", "\\?") }(.+))/

    ##
    # @constructor
    #
    def initialize string, options
      super(string, options)

      @source_host = SOURCE_HOST
      @source_path = $1 if string =~ URI_REGEX
      @source_id   = $2 if string =~ URI_REGEX

      if @source_id.nil? || @source_id.strip.empty?
        raise ::Songle::SongURI::InvalidSongURIError.new(string)
      end
    end

    ##
    # @method
    #
    def type
      return TYPE
    end
  end
end
