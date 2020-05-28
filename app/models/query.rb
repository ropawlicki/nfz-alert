class Query < ApplicationRecord
  has_many :user_queries, dependent: :destroy
  has_many :users, through: :user_queries
  has_many :query_results, dependent: :destroy
  has_many :results, through: :query_results
  #belongs_to :province_code, foreign_key: :province

  validates :benefit, uniqueness: { scope: [:benefit, :province, :locality, :case ] }
  validates :benefit, :locality, :case, :province, presence: true

  before_validation :capitalize_parameters, on: :create

  PROVINCE_CODES = {
    "01" => "Dolnośląskie",
    "02" => "Kujawsko-pomorskie",
    "03" => "Lubelskie",
    "04" => "Lubuskie",
    "05" => "Łódzkie",
    "06" => "Małopolskie",
    "07" => "Mazowieckie",
    "08" => "Opolskie",
    "09" => "Podkarpackie",
    "10" => "Podlaskie",
    "11" => "Pomorskie",
    "12" => "Śląskie",
    "13" => "Świętokrzyskie",
    "14" => "Warmińsko-mazurskie",
    "15" => "Wielkopolskie",
    "16" => "Zachodnio-pomorskie"
  }

  def decode_province!
    self.province = PROVINCE_CODES.fetch(self.province)
    self
  end

  private
  
    def capitalize_parameters
      self.locality = locality.capitalize
      self.benefit = benefit.capitalize
    end
end
