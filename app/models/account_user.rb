class AccountUser < ApplicationRecord
  belongs_to :account
  belongs_to :user

  enum role: { manager: 0 }
end
