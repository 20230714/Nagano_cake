class Public::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about]
end
