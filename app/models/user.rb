class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_and_belongs_to_many :bugs
   has_and_belongs_to_many :projects      
  def manager?
     user_type=="manager"
  end 
  def developer?
     user_type=="developer"
  end
  def qa?
     user_type=="qa"
  end        
end
