class NotesController < ApplicationController

before_action :set_song
  before_action :set_song_note, only: [:show, :update, :destroy]

  # GET /songs/:song_id/notes
  def index
    json_response(@song.notes)
  end

  # GET /songs/:song_id/notes/:id
  def show
    json_response(@note)
  end

  # POST /songs/:song_id/notes
  def create
    @song.notes.create!(note_params)
    json_response(@song, :created)
  end

  # PUT /songs/:song_id/notes/:id
  def update
    @song.update(note_params)
    head :no_content
  end

  # DELETE /songs/:song_id/notes/:id
  def destroy
    @note.destroy
    head :no_content
  end

  private

  def note_params
    params.permit(:name)
  end

  def set_song
    @song = Song.find(params[:song_id])
  end

  def set_song_note
    @note = @song.notes.find_by!(id: params[:id]) if @song
  end
end
end
