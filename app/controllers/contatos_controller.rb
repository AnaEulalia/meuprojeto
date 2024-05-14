class ContatosController < ApplicationController
  # Função responsável por criar um novo contato no banco de dados com base nos dados enviados pelo cliente
  def create
    @contato = Contato.new(contato_params)
    
    if @contato.save
      render json: @contato, status: :created
    else
      render json: @contato.errors, status: :unprocessable_entity
    end
  end

  # Função responsável por detalhar um contato específico
  def show
    @contato = Contato.find(params[:id])
    render json: @contato
  end

  # Função responsável por listar todos os contatos
  def index
    @contatos = Contato.all
    render json: @contatos
  end

  # Função responsável por atualizar os dados de um contato específico
  def update
    @contato = Contato.find(params[:id])
    
    if @contato.update(contato_params)
      render json: @contato
    else
      render json: @contato.errors, status: :unprocessable_entity
    end
  end

  # Função responsável por deletar um contato específico
  def destroy
    @contato = Contato.find(params[:id])
    @contato.destroy!
  end

  private
  
  # Função que define os parâmetros permitidos para manipulação pelo cliente
  def contato_params
    params.require(:contato).permit(:nome, :telefone, :email)
  end
end
