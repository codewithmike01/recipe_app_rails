class PublicController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
