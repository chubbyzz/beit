class ModelService < ApplicationService
  include ApplicationHelper

  def update_from_webservice_by_make make
    json = get_json_from_uri('http://www.webmotors.com.br/carro/modelos', { marca: make.webmotors_id })

    json.each do |make_param|
      model = Model.new make: make , name: make_param['Nome']
      unless model.save
        puts "Model: The #{make_param['Nome']} fail to save because:"
        make.errors.each &@print_errors
      end
    end
  end

end