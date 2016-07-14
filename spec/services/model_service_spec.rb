require 'rails_helper'

describe ModelService do
  it 'should save from website' do
    models_response = [{Id: 3445,Nome: "1100",Count: 0,NomeAmigavel: "1100"}, {Id: 2154,Nome: "124",Count: 0,NomeAmigavel: "124"}]
    expect(ModelService).to receive(:get_json_from_uri)
                               .with('http://www.webmotors.com.br/carro/modelos', {marca:100}).twice
                               .and_return(models_response.map {|make| make.stringify_keys} )
    make = build :make, webmotors_id: 100, id: 1
    ModelService.update_from_webservice_by_make make
    models = Model.last 2

    expect(models[0].name).to eq "124"
    expect(models[0].make).to eq make
    expect(models[1].name).to eq "1100"
    expect(models[1].make).to eq make
  end
end