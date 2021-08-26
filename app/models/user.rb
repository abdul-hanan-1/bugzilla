class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :project_users, dependent: :destroy
   has_many :projects , through: :project_users   
   has_many :bug_users, dependent: :destroy
   has_many :bugs , through: :bug_users      
  def manager?
     user_type=="manager"
  end 
  def developer?
     user_type=="developer"
  end
  def qa?
     user_type=="qa"
  end  
  scope :developers, -> { where(user_type: "developer") } 
  scope :qas, -> { where(user_type: "qa") } 
  scope :not_yet_added, ->(id) { select{|u| !u.projects.pluck(:id).include?(id)} }       
end