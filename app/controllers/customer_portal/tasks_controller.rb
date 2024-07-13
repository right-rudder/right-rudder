class CustomerPortal::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = Account.all.includes(:tasks)
  end
end
