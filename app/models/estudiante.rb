class Estudiante < ActiveRecord::Base
  validates :nombre, :presence => true,
  :length => { :maximum => 80 }

  validates :email, :presence => true,
 :uniqueness => true,
 :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

validates :cedula, :presence => true,
:length => { :minimum => 6, :maximum => 15 },
:numericality => true

  attr_accessible :cedula, :direccion, :email, :fch_nacimineto, :nombre, :curso_id, :photo
	def self.search(search)
		where('nombre like ? or email like ? or cedula like ? or direccion like ?' , "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end

has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/estudiantes/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/estudiantes/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

belongs_to :curso

end
