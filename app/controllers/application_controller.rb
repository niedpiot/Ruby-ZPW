class ApplicationController < ActionController::Base
  def hello
    render plain: 'Witaj świecie!'
  end

  def goodbye
    render plain: 'Do zobaczenia!'
  end
end
