module V1


    class SongsController < ApplicationController

        before_action :set_song, only: [:show, :update, :destroy]

        #GET song
        def index
            @songs=current_user.songs
            json_response(@songs)
        end

        def create
            @song= current_user.songs.create!(song_params)
            json_response(@song, :created)

        end

        def show
            json_response(@song)
        end

        def destroy
            @song.destroy
            head :no_content
        end

        def song_params
            params.permit(:title)
        end

        def set_song
            @song= Song.find(params[:id])
        end

    end

end