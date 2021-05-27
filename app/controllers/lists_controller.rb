class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_param)
  end

  def new
    @list = List.new
  end


end
