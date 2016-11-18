class TempInvader < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", thumb: "150x150>" }, default_url: "/images/:style/tada.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
