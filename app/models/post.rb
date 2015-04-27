class Post < ActiveRecord::Base
	acts_as_votable
	acts_as_taggable
	belongs_to :user
	has_many :comments, dependent: :destroy

	has_attached_file :image, :styles => { :medium => "300x300#" , :front_image => "500x300#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	def tag_list_fixed
		tag_list.to_s
	end

	def tag_list_fixed=(tag_list_string)
		self.tag_list = tag_list_string
	end

	def self.search(query)
		where("title like ?", "%#{query}%")
	end
end
