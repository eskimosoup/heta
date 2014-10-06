class Apprentice < ActiveRecord::Base

  mount_uploader :image, ApprenticeUploader

  belongs_to :company
  belongs_to :apprentice_pathway

end
