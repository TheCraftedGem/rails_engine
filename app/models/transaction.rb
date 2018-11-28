class Transaction < ApplicationRecord
  validates_presence_of :invoice_id, :result

  belongs_to :invoice

  scope :success, -> { where(result: 'success') }
end