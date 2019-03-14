class Task < ApplicationRecord
  # before_validation :set_nameless_name

  # validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belongs_to :user

  has_one_attached :image

  scope :recent, -> { order(created_at: :desc)}
  # Ex:- scope :active, -> {where(:active => true)}

  private
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることは出来ません') if name&.include?(',')
    end
  
    def set_nameless_name
      self.name = '名前無し' if name.blank?
    end

    def self.ransackable_attributes(auth_object = nil)
      %w[name created_at]
    end

    def self.ransackable_associations(auth_object = nil)
      []
    end
end
