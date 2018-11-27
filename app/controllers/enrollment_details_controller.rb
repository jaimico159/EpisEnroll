class EnrollmentDetailsController < ApplicationController
  before_action :authenticate_admin!, only: %i[destroy]
  before_action :set_enrollment_detail, only: %i[destroy]
  def destroy
    @enrollment_detail.destroy
    respond_to do |format|
      format.html { redirect_to enrollment_detail_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def set_enrollment_detail
    authorize current_admin, policy_class: StudentPolicy
    @enrollment_detail = EnrollmentDetail.find(params[:id])
  end
end
