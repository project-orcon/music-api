class SongsController < ApplicationController

    before_action :set_song, only: [:show, :update, :destroy]

    #GET song
    def index
        @songs=Song.all
        json_response(@songs)
    end

    def create
        @song= Song.create!(song_params)
    end

    def show
        json_response(@song)
    end

    def destroy
        @song.destroy
        head :no_content
    end

    def song_params
        params.permit(:title,:created_by)
    end

    def set_song
        @song= Song.find(params[:id])
    end

end
