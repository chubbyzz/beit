require 'rails_helper'

describe MakeService do
  it 'should save from website' do
    makes_response = [{Id: 4,Nome: "FIAT",Count: 0,IsPrincipal: false,Selected: false,NomeAmigavel: "fiat"}, {Id: 2,Nome: "CHEVROLET",Count: 0,IsPrincipal: false,Selected: false,NomeAmigavel: "chevrolet"}]
    expect(MakeService).to receive(:get_json_from_uri)
                               .with('http://www.webmotors.com.br/carro/marcas')
                               .and_return(makes_response.map {|make| make.stringify_keys} )
    MakeService.save_from_webservice
    makes = Make.last 2
    expect(makes[0].name).to eq "FIAT"
    expect(makes[1].name).to eq "CHEVROLET"
  end
end

