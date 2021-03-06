#@# vim: set filetype=ruby:
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
