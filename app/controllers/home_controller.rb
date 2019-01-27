class HomeController < ApplicationController
  def hello
    random_names = ["Ala", "Ola", "Ula"]
    @name = random_names.sample
    @time = Time.zone.now
  end

  def goodbye
  end
end
