class Supervisor::CoursesController < SupervisorController
  before_action :load_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.sorted
                     .paginate(page: params[:page], per_page: Settings.per_page)
  end

  def new
    @course = Course.new
    load_subjects params[:q]
    load_supervisors params[:supervisor_search]
    load_trainees params[:trainee_search]
  end

  def create
    course = Course.new(course_params)
    course.created_by = current_user.id
    if course.save
      flash[:success] = t(:created, resource: Course.name)
      redirect_to supervisor_courses_path
    else
      false[:danger] = t(:wrong_msg)
      render :new
    end
  end

  def edit; end

  def show
    @course_subjects = CourseSubject.course_subjects(@course.id)
    @added_subject_ids = @course_subjects.pluck(:subject_id)
    @subjects = Subject.availables(@added_subject_ids)
    @subjects = Subject.all if @subjects.empty?
  end

  def update
    if @course.update(course_params)
      flash[:success] = t(:updated, resource: Course.name)
      redirect_to supervisor_courses_path
    else
      false[:danger] = t(:wrong_msg)
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = t(:deleted, resource: Course.name)
    else
      false[:danger] = t(:wrong_msg)
    end
    redirect_to supervisor_courses_path
  end

  private

  def load_course
    @course = Course.find_by(id: params[:id])
    return if @course
    render plain: t(:not_found)
  end

  def load_subjects param
    @q = Subject.ransack(param)
    @subjects = @q.result.paginate(page: params[:subject_page],
                                   per_page: Settings.five_per_page)
  end

  def load_supervisors param
    @qs = User.supervisor.ransack(param)
    @supervisors = @qs.result.paginate(page: params[:supervisor_page],
                                         per_page: Settings.five_per_page)
  end

  def load_trainees param
    @qt = User.trainee.ransack(param)
    @trainees = @qt.result.paginate(page: params[:trainee_page],
                                   per_page: Settings.five_per_page)
  end
end
