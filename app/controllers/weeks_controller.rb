
class WeeksController < ApplicationController
  def index
    @weeks = Week.all
  end

  def show
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @week = @course.weeks.new
  end

  def create
    @course = Course.find(params[:course_id])
    @week = @course.weeks.new(week_params)
    if @week.save
      flash[:notice] = "Week successfully added!"
      redirect_to course_path(@week.course)
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @week= Week.find(params[:id])
    if @week.update(week_params)
      flash[:notice] = "Edit Successful!"
      redirect_to course_week_path(@course, @week)
    else
      render :edit
    end
  end

  def destroy
    @week = Week.find(params[:id])
    @week.destroy
    redirect_to course_path(@week.course)
  end

  private
  def week_params
    params.require(:week).permit(:name)
  end

end
