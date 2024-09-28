class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy invite_user ]
  load_and_authorize_resource except: %i[ users ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all.includes(logo_attachment: :blob)
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def invite_user
    email = params[:email]
    user = User.find_by(email: email)

    unless user
      user = User.invite!(email: email, username: email)
    end

    @account.invite_user(user)
    redirect_to @account, notice: "Invitation sent to #{email}."
  end

  def users
    @account = Account.findr(params[:account_id])
    authorize! :read, @account
    @account_users = @account.account_users.includes(:user)
    authorize! :read, AccountUser
  end

  def onboarding
    @account = Account.findr(params[:account_id])
    authorize! :read, @account
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.findr(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :email, :phone, :website, :logo, :account_manager_id, :lead_developer_id)
    end
end
