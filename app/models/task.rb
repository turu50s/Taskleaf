class Task < ApplicationRecord
  # before_validation :set_nameless_name

  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belongs_to :user

  private
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることは出来ません') if name&.include?(',')
    end
  
    def set_nameless_name
      self.name = '名前無し' if name.blank?
    end
end
