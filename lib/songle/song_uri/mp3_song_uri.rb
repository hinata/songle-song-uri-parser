#@# vim: set filetype=ruby:
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
    URI_REGEXP = /^(\/\/|http(|s):\/\/)(.+)$/

    ##
    # @constructor
    #
    def initialize query_string, options
      super(options)

      if query_string =~ URI_REGEXP
        query_string = $3
      end

      if query_string =~ /#{ self.endpoint_host }#{ self.endpoint_path }(.+)/
        query_string = $1
      end

      source_uri =
        ::URI.parse("//#{ query_string }")

      @source_host = source_uri.host
      @source_path = source_uri.path
      @source_id   = nil

      if source_uri.query
        @source_path += "?#{ source_uri.query }"
      end
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
