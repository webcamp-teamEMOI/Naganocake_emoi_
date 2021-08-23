class Public::SearchesController < ApplicationController

  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @value)
  end

  private

  def match(value)
    Item.where(name: value)
  end

  def genre(value)
    @genre = Genre.find_by(name: value)
    Item.where(genre_id: @genre.id)
  end

  def forward(value)
    Item.where("name LIKE ?", "#{value}%")        
  end

  def backward(value)
    Item.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Item.where("name LIKE ?", "%#{value}%")
  end

  def search_for(how, value)
    case how
    when 'match'
      match(value)
    when 'genre'
      genre(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end

end
