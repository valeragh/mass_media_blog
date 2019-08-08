class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def size_range
	  1..2.megabytes
	end

	private

	  def check_extension_whitelist! new_file
	    extension = new_file.extension.to_s
	    if extension_whitelist && !whitelisted_extension?(extension)
	      raise CarrierWave::IntegrityError, I18n.translate(:"errors.messages.extension_whitelist_error", extension: extension, allowed_types: Array(extension_whitelist).join(", "))
	    end
	  end

	  def whitelisted_extension? extension
	    downcase_extension = extension.downcase
	    Array(extension_whitelist).any? { |item| downcase_extension =~ /\A#{item}\z/i }
	  end
end
