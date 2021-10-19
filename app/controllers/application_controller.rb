class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception

  before_action :authenticate_user!
  layout :layout_by_resource
  before_action :type_involveds

  

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

@create = 'Registro Criado com Sucesso'
@save = 'Registro Salvo com Sucesso'
@update1 = 'Registro Atualizado com Sucesso'



  def printer(template, file)

    respond_to do |format|
      format.html
      format.pdf do
        render template: template, 
        pdf: file, 
        header:  { html: {template: @header }},
        footer:  { html: {template: @footer }}
      end
    end 
  end



  def type_involveds

    if devise_controller?
    else
      @providencas = ApplicationRecord.providencas.keys




      @typeinvolveds = ApplicationRecord.typeinvolveds.keys
      @tps = ApplicationRecord.tps.keys
      @offices = ApplicationRecord.offices.keys
   
      @origems = ApplicationRecord.origems.keys
      @tipos = ApplicationRecord.tipos.keys
      @procedimentos = ApplicationRecord.procedimentos.keys
      @destinos = ApplicationRecord.destinos.keys
      @tipo_veiculo = ApplicationRecord.tipo_veiculos.keys
      @cores = ApplicationRecord.cores.keys

      
      @tipobocs = Boc.tipos.keys

      @cities = City.all
      @servers = Server.where(office: 1 , active: true)
      @servers_delegado = Server.where(office: 0 , active: true)
      @inqueries_all = Inquery.all_user(current_user.registry_id).where(conclusion: false)
      @registries = Registry.where(active: true).order(:name)
      @people = Person.all


      @header = 'layouts/related/header.html'
      @footer = 'layouts/related/footer.html'

    end
  end
end
