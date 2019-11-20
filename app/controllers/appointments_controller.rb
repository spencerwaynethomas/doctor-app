class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [:show, :destroy]
  def index
    @appointments = current_user.appointments
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end
  private
  # def set_doctor
  #   @doctor = current_user.doctors.find(params[:doctor_id])
  # end

  def appointment_params
    params.require(:appointment).permit(:time, :date)
  end
  def set_appointment
    @account = current_user.appointment.find(params[:id])
  end

end
