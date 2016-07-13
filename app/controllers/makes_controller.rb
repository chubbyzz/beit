class MakesController < ApplicationController
  def index
    @makes = Rails.cache.fetch 'make_to_select', expires_in: 40.minute do
       Make.pluck :name, :id
    end
  end

  def show
     @make = Make.includes(:models).find(params[:make])
  end
end
