class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admin_genres_path
    else
      redirect_to request.referer,notice:"追加できませんでした"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      redirect_to request.referer,notice:"変更を保存できませんでした"
    end
  end

  private
    def genre_params
       params.require(:genre).permit(:name)
    end

end
