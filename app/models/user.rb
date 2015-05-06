class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_taggable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "50x50#" }, :default_url => "/images/:style/missing.jpg"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def tag_list_fixed
		tag_list.to_s
	end

	def tag_list_fixed=(tag_list_string)
		self.tag_list = tag_list_string
	end
end
