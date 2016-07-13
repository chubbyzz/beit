class Make < ActiveRecord::Base
  has_many :models

  after_save :update_models_from_this_make
  validates :name, uniqueness: true

  def update_models_from_this_make
    model_service = ModelService.new
    model_service.update_from_webservice_by_make self
  end
end
