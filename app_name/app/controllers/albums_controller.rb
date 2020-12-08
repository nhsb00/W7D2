class AlbumsController < ApplicationController

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def new
        @album = Album.new(album_params)
        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.vae
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end

    end

    def edit
        @album = Album.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:id])

        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end
    
    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to album_url(@album)
    end

    private
    
    def album_params
        params.require(:album).permit(:record_id, :name, :year, :live)
    end
end