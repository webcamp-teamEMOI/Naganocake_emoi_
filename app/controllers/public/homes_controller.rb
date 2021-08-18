class Public::HomesController < ApplicationController
    def top
        @genres = Genre.all
        @items = Item.order(create_at: :desc).limit(4)
    end
    
    def about
    end
end
