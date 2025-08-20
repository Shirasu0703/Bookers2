class HomesController < ApplicationController
  def top
  end

  def about
    root_to: "homes#about"
  end
end
