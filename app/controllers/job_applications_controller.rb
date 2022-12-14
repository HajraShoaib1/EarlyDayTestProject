class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :update, :destroy]
  # before_action :authenticate_user!

  # GET /job_applications
  def index
    @job_applications = current_user.job_application.all
    authorize @job_applications

    render json: @job_applications
  end

  # GET /job_applications/1
  def show
    authorize @job_applications

    render json: @job_application
  end

  # POST /job_applications
  def create
    @job_application = JobApplication.new(job_application_params)
    # authorize @job_applications

    if @job_application.save
      render json: @job_application, status: :created, location: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_applications/1
  def update
    authorize @job_applications
    if @job_application.update(job_application_params)
      render json: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_applications/1
  def destroy
    authorize @job_applications
    @job_applications.withdrawn!

    render json: @job_applications
  rescue ActiveRecord::RecordInvalid => e
    rendor json: e.to_json, status: :unprocessable_entity
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params.require(:job_application).permit(:job_id, :user_profile_id, :status)
    end
end
