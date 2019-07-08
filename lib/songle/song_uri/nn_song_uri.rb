#@# vim: set filetype=ruby:
module ::Songle::SongURI
  class NnSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    SOURCE_HOST = "www.nicovideo.jp"

    ##
    # @constant
    #
    SOURCE_PATH = "/watch/"

    ##
    # @constant
    #
    TYPE = "niconico"

    ##
    # @constant
    #
    URI_REGEXP = /#{ SOURCE_HOST.gsub("www.", "") }(#{ SOURCE_PATH.gsub("?", "\\?") }(.+))/

    ##
    # @constructor
    #
    def initialize query_string, options
      super(options)

      @source_host = SOURCE_HOST
      @source_path = $1 if query_string =~ URI_REGEXP
      @source_id   = $2 if query_string =~ URI_REGEXP

      if @source_id.nil? || @source_id.strip.empty?
        raise ::Songle::SongURI::InvalidSongURIError.new(query_string)
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
