class Assign < ApplicationRecord

    belongs_to :user
    has_one :offer
end
