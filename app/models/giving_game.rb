class GivingGame < ActiveRecord::Base
  belongs_to :user

  # titles of giving games should be unique
  validates :title, uniqueness: true
  validates :total_money, :numericality => { :greater_than_or_equal_to => 0 }
  validates :per_transaction, :numericality => { :greater_than_or_equal_to => 0 }
  # needs titles for all of the titles of things.
  validates_presence_of :title, :charityA_title, :charityB_title, :total_money, :per_transaction
  #validates that the moneys need to be numebrs
  validates_numericality_of :per_transaction, :total_money

  def voteForA
    self.votesA += 1
    self.save
  end
    
  def voteForB
    self.votesB += 1
    self.save
  end
  # has_attached_file :image, styles: {large: '600x600>', medium: '300x300>', thumbnail: '150x150#' }
  validates_attachment_content_type :image, content_type: /\image\/.*\Z/
  
  def image_file= (fileobj)
    if fileobj.size > 0
      @image_file = fileobj
      self.image = unique_and_proper_filename(fileobj.original_filename)
    end
  end

  def thumbnail_file= (fileobj)
    if fileobj.size > 0
      @thumbnail_file = fileobj
      self.thumbnail = unique_and_proper_filename(fileobj.original_filename)
    end
  end 

  def save_files

    # Image save
    if !save_uploaded_file(@image_file, IMAGE_DIR, self.image)
      return false
    end
    
    return true

  end

  private 
  def unique_and_proper_filename(filename)
    Time.now.to_i.to_s + "_" + File.basename(filename)
  end

  private 
  def save_uploaded_file(fileobj, filepath, filename)

    # Complete Path
    complete_path = Rails.root + "/public/" + filepath

    # if neccessary, create directory
    FileUtils.mkdir_p(complete_path) unless File.exists?(complete_path)

    # save data
    begin
      f = File.open(complete_path + "/" + filename, "wb")
      f.write(fileobj.read)
    rescue 
      return false
    ensure
      f.close unless f.nil?
    end

  end
end