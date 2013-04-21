class Instructor < ActiveRecord::Base
  validates :nombres, :presence => true,
:length => { :maximum => 80 }

validates :email, :presence => true,
:uniqueness => true,
:format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

validates :cedula, :presence => true,
:length => { :minimum => 6, :maximum => 15 },
:numericality => true

validates :telefono, :presence => true,
:length => { :minimum => 7, :maximum => 20 },
:numericality => true

validates :modalidad, :presence => true,
:length => { :maximum => 25 }

  attr_accessible :cedula, :direccion, :email, :fch_ncto, :modalidad, :nombres, :telefono

  def self.search(search)
  where('nombres like ? or email like ? or cedula like ? or direccion like ? or telefono like ? or modalidad like ?', "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

has_many :horarios
end
