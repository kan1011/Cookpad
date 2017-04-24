class Uploader < ApplicationRecord
  belongs_to :user
  has_attached_file :uploaded_image, 
    styles: { medium: "300x300>", thumb: "100x100>" }, 
    storage: :azure,
    url: ':azure_path_url',
    path: ":class/:attachment/:id/:style/:filename",
    storage: :azure,
    azure_credentials: {
      storage_account_name: 'cookpad',
      access_key: 'wCTArjdavgVAZ3yyInLSnqY9JO/ek+jxgoWGhwHYhnfMbA1pnGeOEPbgaDKqMs+bk1lLSj1mF7seD9dggFq8+g==',
      container: 'cookpad'
    }

  validates_attachment_content_type :uploaded_image, content_type: /\Aimage\/.*\z/
end
