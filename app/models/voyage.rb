class Voyage < ApplicationRecord
  has_many :containers 
  accepts_nested_attributes_for :containers, allow_destroy: true, reject_if: :all_blank
  before_validation :update_container

  def update_container
    logger.info "UPDATE CONTAINER"
  end 
end
