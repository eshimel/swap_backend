#
class Profile < ActiveRecord::Base
  # include Authentication
  belongs_to :user
  has_many :giver_trades, class_name:  'Trade',
                          foreign_key: 'giver_id',
                          dependent:   :destroy

  has_many :given_resources, through: :giver_resources, source: :resource
  has_many :received_resources, through: :receiver_resources, source: :resource
  has_many :givers, through: :giver_trades, source: :receiver

  has_many :receiver_trades, class_name:  'Trade',
                             foreign_key: 'receiver_id',
                             dependent:   :destroy

  has_many :borrowers, through: :borrower_loans, source: :loaner

   has_attached_file :avatar,  #Or whatever you want to call the image you're uploading.
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/images/:style/missing.png",
              :path => "/images/:id/:style/:filename"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # By default, every file uploaded will be named 'data'.
  # This renames the file to a timestamp, preventing name collisions.
  # This will also fix browser caching issues for updates
  def rename_avatar
    self.avatar.instance_write :file_name, "#{Time.now.to_i.to_s}.png"
  end

  before_post_process :rename_avatar

end
