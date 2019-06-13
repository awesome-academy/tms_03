class Supervisor::SubjectsController < SupervisorController
  before_action :load_subject, except: [:index, :create, :new]

  def index
    @subjects = Subject.sorted
                       .paginate(page: params[:page],
                                 per_page: Settings.per_page)
  end

  def new
    @subject = Subject.new
  end

  def create
    subject = Subject.new(subject_params)
    subject.created_by = current_user.id
    if subject.save
      flash[:success] = t(:created, resource: Subject.name)
      redirect_to supervisor_subjects_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @subject.update(subject_params)
      flash[:success] = t(:updated, resource: Subject.name)
      redirect_to supervisor_subjects_path
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t(:deleted, resource: Subject.name)
    else
      flash[:danger] = t(:wrong_msg)
    end
    redirect_to supervisor_subjects_path
  end

  private

  def load_subject
    @subject = Subject.find_by(id: params[:id])
    return if @subject
    render plain: t(:not_found)
  end

  def subject_params
    params.require(:subject).permit(:title, :description)
  end
end
