class GeneratorController < ApplicationController
  def index
    @links = Link.all
  end
  
  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params.merge(short: link_short))
    if @link.save
      flash[:success] = "Votre lien a été généré avec succès !"
      redirect_to generator_path
    else
      flash[:error] = "Une erreur s'est produite"
      render :new
    end
  end

  def redirect
    @link = Link.find_by(short: params[:short])
    Rails.cache.fetch([self, :short]) do
      @original = @link.original
    end
    @link.update_attribute(:view, @link.view + 1)
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
