class Query < ApplicationRecord
  has_many :user_queries, dependent: :destroy
  has_many :users, through: :user_queries
  has_many :query_results, dependent: :destroy
  has_many :results, through: :query_results
  belongs_to :province_code, foreign_key: :province, optional: true

  validates :benefit, uniqueness: { scope: [ :locality, :case ] }
  validates :benefit, :locality, :case, presence: true

  before_validation :capitalize_parameters, on: :create

  #def decode_province!
    #self.province = ProvinceCode.find_by_code(self.province).name
    #self
  #end

  private
  
    def capitalize_parameters
      self.locality = locality.capitalize
      self.benefit = benefit.capitalize
    end
end
