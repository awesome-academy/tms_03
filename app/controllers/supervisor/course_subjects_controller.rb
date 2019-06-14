class Supervisor::CourseSubjectsController < SupervisorController
  before_action :load_course_subject, except: [:create]

  def create
    @course_subject = CourseSubject.new
    @course_subject.course_id = params[:course_id]
    @course_subject.subject_id = params[:subject_id]
    if @course_subject.save
      flash[:success] = t(:added)
    else
      flash[:danger] = t(:wrong_msg)
    end
    redirect_to supervisor_course_path(params[:course_id])
  end

  def edit; end

  def update
    if @course_subject.update(course_subject_params)
      flash[:success] = t(:added)
      redirect_to supervisor_course_path(params[:course_id])
    else
      render :edit
    end
  end

  def update_status
    @course_subject.toggle(:status)
    if @course_subject.save
      redirect_to supervisor_course_path(params[:course_id])
    else
      render :edit
    end
  end

  def destroy
    if @course_subject.destroy
      flash[:success] = t(:removed)
    else
      flash[:danger] = t(:wrong_msg)
    end
    redirect_to supervisor_course_path(params[:course_id])
  end

  private
  def load_course_subject
    @course_subject = CourseSubject.find_by(course_id: params[:course_id],
                                        subject_id: params[:subject_id])
    return if @course_subject
    render plain: t(:not_found)
  end

  def course_subject_params
    params.require(:course_subject).permit(:start_date, :finish_date, :status)
  end
end
