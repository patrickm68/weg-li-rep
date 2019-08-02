class Authorization < ActiveRecord::Base
  belongs_to :user

  validates :uid, :provider, presence: true
  validates :uid, uniqueness: {scope: :provider}
  validates :provider, uniqueness: {scope: :user}
end
