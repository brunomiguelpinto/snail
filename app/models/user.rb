class User < ApplicationRecord
  EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  has_secure_password
  has_many :sessions, dependent: :destroy

  attr_accessor :rgpd_accepted

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true,
                            uniqueness: { case_sensitive: false },
                            format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :rgpd_accepted, acceptance: true, on: :create

  before_create :stamp_rgpd_acceptance

  private

  def stamp_rgpd_acceptance
    self.rgpd_accepted_at ||= Time.current
  end
end
