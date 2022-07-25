class GeneratorController < ApplicationController
  before_action :logged_user

  def logged_user
    unless logged_in?
      flash[:error] = "Vous devez vous connecter"
      redirect_to "/welcome"
    end
  end

  def index
    @links = Link.where(user_id: current_user.id)
  end
  
  def show
    @link = Link.find(params[:id])
    unless @link.user_id === current_user.id
      redirect_to root_path
    end
    rescue ActiveRecord::RecordNotFound
    flash[:error] = "Lien non trouvé"
    redirect_to root_path
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params.merge(short: Link.generate_unique_short, user_id: current_user.id))
    if @link.save
      flash[:success] = "Votre lien a été généré avec succès !"
      redirect_to action: "index"
    else
      flash[:error] = "Une erreur s'est produite"
      render :new
    end
  end

  def redirect
    if Link.find_by(short: params[:short])
      Rails.cache.fetch([self, :short]) do
        @link = Link.find_by(short: params[:short])
        @original = @link.original
      end
      if @link.get_link(@link.short)
        @link.increment_views(@link.short)
      else
        @link.set_link(@link.short, @link.view)
      end
      redirect_to @original
    else
      redirect_to root_path
    end
  end

  private
  def link_params
    params.require(:link).permit(:original)
  end
end
