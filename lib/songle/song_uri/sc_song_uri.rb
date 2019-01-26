# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class ScSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    SOURCE_HOST = "soundcloud.com"

    ##
    # @constant
    #
    SOURCE_PATH = "/"

    ##
    # @constant
    #
    TYPE = "soundcloud"

    ##
    # @constant
    #
    URI_REGEX = /#{ SOURCE_HOST.gsub("www.", "") }(#{ SOURCE_PATH.gsub("?", "\\?") }(.+))/

    ##
    # @constructor
    #
    def initialize query, options
      super(query, options)

      @source_host = SOURCE_HOST
      @source_path = $1 if query =~ URI_REGEX
      @source_id   = $2 if query =~ URI_REGEX

      if @source_id.nil? || @source_id.strip.empty?
        raise ::Songle::SongURI::InvalidSongURIError.new(query)
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
