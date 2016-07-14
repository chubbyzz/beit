require 'rails_helper'

describe MakesController, type: :controller do

  it 'should show a list of makes' do
    makes = create_list :make, 2
    get :index
    expect(assigns(:makes)).to include([makes[0].name, makes[0].id], [makes[1].name, makes[1].id])
    expect(response).to render_template('index')
  end

  it 'should show all models from a make' do
    make = create(:model).make
    get :show, make: make.id

    expect(assigns(:make)).to eq make
  end
end