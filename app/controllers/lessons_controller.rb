
class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @week = Week.find(params[:week_id])
    @lesson = Lesson.find(params[:id])
  end

  def new
    @week = Week.find(params[:week_id])
    @lesson = @week.lessons.new
  end

  def create
    @week = Week.find(params[:week_id])
    @lesson = @week.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson successfully added!"
      redirect_to course_week_path(@week.course, @lesson.week)
    else
      render :new
    end
  end

  def edit
    @week = Week.find(params[:week_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @week = Week.find(params[:week_id])
    @lesson= Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "Edit Successful!"
      redirect_to week_lesson_path(@week, @lesson)
    else
      render :edit
    end
  end

  def destroy
    @week = Week.find(params[:week_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to course_week_path(@week.course, @lesson.week)
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :body, :day, :lesson_type)
  end

end
