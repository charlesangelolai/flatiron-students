class SurveysController < ApplicationController
  include SurveysHelper

  before_action :redirect_if_not_logged_in, :redirect_if_no_cohort, :redirect_if_not_admin
  before_action :find_survey, only: [:show, :edit, :update, :destroy]
  
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
    @survey_question = @survey.survey_questions.build
  end

  def show
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to survey_path(@survey)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @survey.update(survey_update_params)
      redirect_to survey_path(@survey)
    else
      binding.pry
      render :edit
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_path
  end

  private

  def find_survey
    @survey = Survey.find_by_id(params[:id])
  end

  def redirect_if_not_admin
    unless is_admin?
      redirect_to dashboard_path
    end
  end

  def survey_params
    params.require(:survey).permit(
      :name,
      :phase_num,
      survey_questions_attributes: [
        :design_question, 
        :navigation_question, 
        :error_handling_question, 
        :rating
      ]
    )
  end

  def survey_update_params
    params.require(:survey).permit(
      :name,
      :phase_num,
      survey_questions_attributes: [
        :id,
        :design_question, 
        :navigation_question, 
        :error_handling_question, 
        :rating
      ]
    )
  end
end
