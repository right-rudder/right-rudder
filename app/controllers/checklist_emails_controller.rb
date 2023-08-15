class ChecklistEmailsController < ApplicationController
  before_action :set_checklist_email, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:new, :edit, :create, :update, :confirm]
  #invisible_captcha only: [:create, :update], honeypot: :confirm_email

  # GET /checklist_emails or /checklist_emails.json
  def index
    @checklist_emails = ChecklistEmail.all
  end

  def confirm
    render 'confirm'
  end

  # GET /checklist_emails/1 or /checklist_emails/1.json
  def show
  end

  # GET /checklist_emails/new
  def new
    @checklist_email = ChecklistEmail.new
  end

  # GET /checklist_emails/1/edit
  def edit
  end

  # POST /checklist_emails or /checklist_emails.json
  def create
    @checklist_email = ChecklistEmail.new(checklist_email_params)

    respond_to do |format|
      if @checklist_email.save
        CheckListMailer.check_list(@checklist_email.email, @checklist_email.name).deliver_later
        format.html { redirect_to checklist_confirm_path, notice: @checklist_email.name }
        format.json { render :show, status: :created, location: @checklist_email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checklist_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklist_emails/1 or /checklist_emails/1.json
  def update
    respond_to do |format|
      if @checklist_email.update(checklist_email_params)
        format.html { redirect_to checklist_email_url(@checklist_email), notice: "checklist email was successfully updated." }
        format.json { render :show, status: :ok, location: @checklist_email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checklist_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklist_emails/1 or /checklist_emails/1.json
  def destroy
    @checklist_email.destroy

    respond_to do |format|
      format.html { redirect_to checklist_emails_url, notice: "Checklist email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_email
      @checklist_email = ChecklistEmail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checklist_email_params
      params.require(:checklist_email).permit(:name, :phone, :email)
    end
end
