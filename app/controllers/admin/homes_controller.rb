class Admin::HomesController < ApplicationController

  def top
    @orders=Order.all #kaminari用に記述変更する

  end

end
