class OnboardingsController < ApplicationController
  before_action :set_onboarding, only: %i[show edit update destroy]
  before_action :set_account, only: %i[new create]

  def new
    @onboarding = Onboarding.new
  end

  def create
    @onboarding = Onboarding.new(onboarding_params)
    
    respond_to do |format|
      if @onboarding.save
        format.html { redirect_to account_onboarding_url(@account), notice: 'Onboarding was successfully created.' }
        format.json { render :show, status: :created, location: @onboarding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @onboarding.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @onboarding.update(onboarding_params)
        format.html { redirect_to account_onboarding_url(@account), notice: 'Onboarding was successfully updated.' }
        format.json { render :show, status: :ok, location: @onboarding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @onboarding.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_onboarding
    @onboarding = Onboarding.find(params[:id])
  end

  def onboarding_params
    params.require(:onboarding).permit(:account_id, :first_name, :last_name, :phone, :email)
  end

  def set_account
    @account = Account.findr(params[:account_id])
  end
end
