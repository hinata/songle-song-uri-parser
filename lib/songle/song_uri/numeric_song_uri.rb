#@# vim: set filetype=ruby:
module ::Songle::SongURI
  class NumericSongURI
    include ::Songle::SongURI

    ##
    # @constant
    #
    TYPE = "numeric"

    ##
    # @constant
    #
    URI_REGEXP = /^(|[\w.]+\/[\w.]+\/|\/\/[\w.]+\/[\w.]+\/|http(|s):\/\/[\w.]+\/[\w.]+\/)(\d+)$/

    ##
    # @constructor
    #
    def initialize query_string, options
      super(options)

      @source_host = nil
      @source_path = nil
      @source_id   = $3 if query_string =~ URI_REGEXP
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
      return "#{ self.endpoint }#{ @source_id }"
    end
  end
end
