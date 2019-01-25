# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class Mp3SongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    TYPE = "mp3"

    ##
    # @constant
    #
    URI_REGEX = /^(\/\/|http(|s):\/\/)(.+)$/

    ##
    # @constructor
    #
    def initialize string, options
      super(string, options)

      if string =~ URI_REGEX
        string = $3
      end

      if string =~ /^#{ self.endpoint_host }(.+)$/
        string = $1
      end

      if string =~ /^#{ self.endpoint_path }(.+)$/
        string = $1
      end

      source_uri =
        ::URI.parse("//#{ string }")

      @source_host = source_uri.host
      @source_path = source_uri.path
      @source_id   = nil
    end

    ##
    # @method
    #
    def type
      return TYPE
    end

    ##
    # @method
    #
    def to_s
      encoded_source_host =
        ::URI.encode_www_form_component(self.source_host).gsub("+", "%2520")

      encoded_source_path =
        ::URI.encode_www_form_component(self.source_path).gsub("+", "%2520")

      return "#{ self.endpoint }#{ encoded_source_host }#{ encoded_source_path }"
    end
  end
end
