class SessionsController < ApplicationController
  def create
    puts "HELLO"
    puts request.env['omniauth.auth'].extra
    head 200
  end
end
