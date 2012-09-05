class Admin < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessor :password, :verify_password, :new_password
  attr_accessible :username, :password, :password_confirmation, :name  
  cattr_accessor :current_user
  
  ####################
  # Validation
  ####################  
  validates_presence_of     :username , :message => "用户名不能为空" 
  validates_presence_of     :name  , :message => "姓名不能为空"
  validates_uniqueness_of   :username
  
  ####################
  # Actions
  ####################
  before_save :encrypt_password 
  
  
  ####################
  # Authentication methods
  ####################
  def self.authenticate(username, password)
    u = find_by_username(username, nil) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end
  
  def self.encrypt(password)
    Crypto::Key.from_file("#{RAILS_ROOT}/rsa_key.pub").encrypt(password)
  end
  
  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password)
  end
  
  def decrypt(password)
    Crypto::Key.from_file("#{RAILS_ROOT}/rsa_key").decrypt(password)
  end
  
  def authenticated?(password)
    unencrypted_password == password
  end
  
  def unencrypted_password
    # The gsub trickery is to unescape the key from the DB.
    decrypt(crypted_password)#.gsub(/\\n/, "\n")
  end
  
  # These create and unset the fields required for remembering users
  # between browser closes
  def remember_me
    remember_me_for 2.years
  end
  
  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end
  
  def remember_me_until(time)
    self.remember_token_expires_at = time
    key = "#{username}--#{remember_token_expires_at}"
    self.remember_token = Digest::SHA1.hexdigest(key)
    save(false)
  end
  
  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end
  
  def change_password?(passwords)
    self.password_confirmation = passwords[:password_confirmation]
    self.verify_password = passwords[:verify_password]
    unless verify_password == unencrypted_password
      errors.add(:password, "不正确")
      return false
    end
    unless passwords[:new_password] == password_confirmation
      errors.add(:password, "新密码与密码确认不一致")
      return false
    end
    self.password = passwords[:new_password]
    save
  end
  
  def encrypt_password
    return if password.blank?
    self.crypted_password = encrypt(password)
  end  
  
  def password_required?
   (crypted_password.blank?) || !password.blank? || !verify_password.nil?
  end  
  
end
