# == Schema Information
# Schema version: 20110208224139
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  phone              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  attr_accessible :first_name, :last_name, :email, :phone, :password, :password_confirmation
  
  has_many :volunteers, :foreign_key => "user_id", :dependent => :destroy
  has_many :events, :through => :volunteers
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :first_name,  :presence   => true,
                          :length     => { :maximum => 50 }
  validates :last_name,   :presence   => true,
                          :length     => { :maximum => 50 }                        
  validates :email,       :presence   => true,
                          :format     => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
  
  # Automatically create the virtual attribute 'password_confirmation'
  validates :password,  :presence => true,
                        :confirmation => true,
                        :length => { :within => 6..40 }
                        
  before_save :encrypt_password
  
  # Return true if user's password matches submitted password
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  def attending?(event)
    volunteers.find_by_event_id(event)
  end
  
  def attend!(event)
    volunteers.create!(:event_id => event.id)
  end
  
  private
  
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
