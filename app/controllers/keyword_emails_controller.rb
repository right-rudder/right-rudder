
class KeywordEmailsController < ApplicationController
  before_action :set_keyword_email, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:new, :edit, :create, :update, :confirm]
  #invisible_captcha only: [:create, :update], honeypot: :confirm_email

  # GET /keyword_emails or /keyword_emails.json
  def index
    @keyword_emails = KeywordEmail.all
  end

  def confirm
    render 'confirm'
  end

  # GET /keyword_emails/1 or /keyword_emails/1.json
  def show
  end

  # GET /keyword_emails/new
  def new
    @keyword_email = KeywordEmail.new
  end

  # GET /keyword_emails/1/edit
  def edit
  end

  # POST /keyword_emails or /keyword_emails.json
  def create
    @keyword_email = KeywordEmail.new(keyword_email_params)

    respond_to do |format|
      if @keyword_email.save
        KeywordMailer.keyword(@keyword_email.email, @keyword_email.name).deliver_later
        format.html { redirect_to keyword_confirm_path, notice: @keyword_email.name }
        format.json { render :show, status: :created, location: @keyword_email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @keyword_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keyword_emails/1 or /keyword_emails/1.json
  def update
    respond_to do |format|
      if @keyword_email.update(keyword_email_params)
        format.html { redirect_to keyword_email_url(@keyword_email), notice: "keyword email was successfully updated." }
        format.json { render :show, status: :ok, location: @keyword_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @keyword_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keyword_emails/1 or /keyword_emails/1.json
  def destroy
    @keyword_email.destroy

    respond_to do |format|
      format.html { redirect_to keyword_emails_url, notice: "Keyword email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword_email
      @keyword_email = KeywordEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def keyword_email_params
      params.require(:keyword_email).permit(:name, :phone, :email)
    end
end
