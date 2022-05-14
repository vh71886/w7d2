class TracksController < ApplicationController
    def new
        render :new
    end

    def create
        @track = Track.new(track_params)
        if @track.save
            redirect_to track_url(@track)
        else
            flash.new[:errors] = @track.errors.full_messages
            render :new
        end
    end

    def show
        @track = Track.find_by(id: params[:id])
        render :show
    end

    def edit
        @track = Track.find_by(id: params[:id])
        render :edit
    end

    def update
        @track = Track.find_by(id: params[:id])
        if @track && @track.update(track_params)
            redirect_to track_url(@track)
        else
            flash.now[:errors] = @track.errors.full_messages
            render :edit
        end
    end

    def destroy
        @track = Track.find_by(id: params[:id])
        if @track && @track.destroy
            redirect_to album_url(@track.album_id)
        else
            flash[:errors] = @track.errors.full_messages
            redirect_to album_url(@track.album_id)
        end
    end

    private
    def track_params
        params.require(:track).permit(:album_id, :title, :ord, :lyrics, :bonus)
    end
end
