class MakeService < ApplicationService
  extend ApplicationHelper

  def self.save_from_webservice
    json = get_json_from_uri 'http://www.webmotors.com.br/carro/marcas'

    json.each do |make_param|
      make = Make.new name: make_param['Nome'], webmotors_id: make_param['Id']
      unless make.save
        puts "Make The ##{make_param['Id']}-#{make_param['Nome']} fail to save because:"
        make.errors.each &$print_errors
      end
    end
  end

end