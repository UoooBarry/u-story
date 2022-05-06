class LetterController < ApplicationController 
  def index
    render layout: false
  end

  def render_letter
    render '_letter', layout: false, status: :ok
  end
end
