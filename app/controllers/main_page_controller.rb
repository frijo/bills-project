class MainPageController < ApplicationController
  before_action :require_user, only: [:main]
  def main
  end
end
