class V2::SongsController < ApplicationController
    def index
        json_response({ message: 'Hello there'})
      end
    
end
