
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # Initialise une nouvelle tâche pour le formulaire
  end

  def create
    @task = Task.new(task_params) # Crée une nouvelle tâche avec les paramètres du formulaire
    if @task.save
      redirect_to task_path(@task) # Redirige vers la page de détails de la tâche créée
    else
      render :new, status: :unprocessable_entity # Affiche à nouveau le formulaire en cas d'erreur
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed) # Autorise uniquement les paramètres nécessaires
  end
end
