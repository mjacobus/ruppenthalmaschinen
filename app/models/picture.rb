class Picture < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  attr_accessible :description, :file, :title, :sequence

  has_attached_file :file,
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style.:extension",
    :url => "/system/:class/:attachment/:id_partition/:style.:extension",
    :styles => {
      :original => "640x480>",
      :medium => "286x214#",
      :small => "160x120#",
      :thumb => "80x60#"
    }


  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
  validates_attachment_size :file, :less_than => 5.megabytes

end
