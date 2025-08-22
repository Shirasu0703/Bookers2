class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:about, :top]

  def top
    @book = Book.new
  end

  def about
  end
end

