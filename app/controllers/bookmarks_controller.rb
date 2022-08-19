class BookmarksController < ApplicationController
  def new
    #Review pertence ao restaurante. É necessário as daus informações para criar uma instânia nova
    @list = List.find(params[:list_id]) #Selecionando um objeto do banco de dados através do ID
    @bookmark = Bookmark.new # Needed to instantiate the form_for
  end

  def create
    @list = List.find(params[:list_id]) #Selecionando um objeto do banco de dados através do ID
    @bookmark = Bookmark.new(bookmark_params) #Preenche as variáveis de instância do objeto da classe restaurante com os dados inputados no formulário.
    @bookmark.list = @list #Vinculandoo objeto restaurant ao objeto review
    if @bookmark.save # Will raise ActiveModel::ForbiddenAttributesError. Salva o objeto no banco de dados
      redirect_to list_path(@list) #Redireciona para o show, enviando como argumento um objeto do tipo restaurante
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to list_path, status: :see_other
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
