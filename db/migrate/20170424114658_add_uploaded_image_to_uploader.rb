class AddUploadedImageToUploader < ActiveRecord::Migration[5.0]
  def change
    add_attachment :uploaders, :uploaded_image
  end
end
