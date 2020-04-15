class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
         
  has_many :user_queries, dependent: :destroy
  has_many :queries, through: :user_queries
  has_many :user_fresh_results, dependent: :destroy
  has_many :result, through: :user_fresh_results
 
end
