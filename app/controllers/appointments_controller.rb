class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @surgeon = @doctor.appointments.where(role: "Surgeon")
    @nurse = @doctor.appointments.where(role: "Nurse")
    @patient = @doctor.appointments.where(role: "Patient")
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def edit
  end
  
  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appointment_params
      params.require(:appointment).permit(:role, :user_id)
    end
end
