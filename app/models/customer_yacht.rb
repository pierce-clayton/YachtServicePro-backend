class CustomerYacht < ApplicationRecord
  belongs_to :customer
  belongs_to :yacht
end
