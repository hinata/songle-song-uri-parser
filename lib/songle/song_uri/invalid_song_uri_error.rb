#@# vim: set filetype=ruby:
module ::Songle::SongURI
  class InvalidSongURIError < ::StandardError
    ##
    # @constructor
    #
    def initialize query_string
      super("'#{ query_string }' is invalid songle's song uri.")
    end
  end
end
