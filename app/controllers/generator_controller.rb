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
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params.merge(short: link_short, user_id: current_user.id))
    if @link.save
      flash[:success] = "Votre lien a été généré avec succès !"
      redirect_to action: "index"
    else
      flash[:error] = "Une erreur s'est produite"
      render :new
    end
  end

  def redirect
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
  end

  def link_short
    short_unique = SecureRandom.alphanumeric(6)
    while Link.where(short: short_unique).exists? == true do
      short_unique = SecureRandom.alphanumeric(6)
    end
    return short_unique
  end

  private
  def link_params
    params.require(:link).permit(:original)
  end
end
