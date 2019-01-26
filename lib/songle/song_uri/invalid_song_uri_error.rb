# -*- coding: utf-8 -*-
module ::Songle::SongURI
  class InvalidSongURIError < ::StandardError
    ##
    # @constructor
    #
    def initialize query
      super("'#{ query }' isn't song uri.")
    end
  end
end
