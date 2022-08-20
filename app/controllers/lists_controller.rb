class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new # Needed to instantiate the form_for
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params) #Preenche as variáveis de instância do objeto da classe restaurante com os dados inputados no formulário.
    if @list.save # Will raise ActiveModel::ForbiddenAttributesError. Salva o objeto no banco de dados
      redirect_to list_path(@list) #Redireciona para o show, enviando como argumento um objeto do tipo restaurante
    else
      render :new, status: :unprocessable_entity

    end
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
