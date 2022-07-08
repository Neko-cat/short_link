class GeneratorController < ApplicationController
  def index
    @links = Link.all
  end
  
  def show
    @link = Link.find(params[:short])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to generator_path, notice: "Votre lien a été généré avec succès !"
    else
      flash[:alert] = "Une erreur s'est produite"
      render :new
    end
  end

  private
  def link_params
    params.require(:link).permit(:original)
  end
end
