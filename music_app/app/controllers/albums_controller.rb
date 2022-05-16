class AlbumsController < ApplicationController
    def new
        @album = Album.new
        @album.band_id = params[:band_id]
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def show
        # how does params[:id] always know which id? should album_id be used instead?
        @album = Album.find_by(album_id: params[:id])
        render :show
    end

    def edit
        @album = Album.find_by(album_id: params[:id])
        render :edit
    end

    def update
        @album = Album.find_by(album_id: params[:id])
        if @album && @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = ["Invalid update."]
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(album_id: params[:id])
        if @album && @album.destroy
            redirect_to band_url(@album.band_id)
        else
            flash[:errors] = @album.errors.full_messages
            redirect_to album_url(@album)
        end
    end

    private
    def album_params
        params.require(:album).permit(:band_id, :year, :title, :studio)
    end
end
