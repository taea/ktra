class IterationsController < ApplicationController
  def index
    @iterations = Iteration.find(:all, :order => "start_date DESC")
  end
end
