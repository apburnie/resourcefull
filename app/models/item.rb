class Item < ActiveRecord::Base
  belongs_to :user
  #has_many :requests
  has_one :request
  validates :name, presence: true, length: { minimum: 3 }

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                            default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def current_borrower
    User.find(self.user_id).name
  end
end
