require 'pry-byebug'
require_relative '../lib/rentvine'

auth = {
  account_code: ENV['RENTVINE_ACCOUNT_CODE'],
  api_key: ENV['RENTVINE_API_KEY'],
  api_secret: ENV['RENTVINE_API_SECRET']
}
rv_client = Rentvine::Client.new(auth)

# =========================================
# File Examples
# =========================================

rv_client.files.each do |file|
  puts [file.file_id, file.title].join(' :: ')
end

# # ===========================

files_id = 52
rv_obj = rv_client.file(files_id)
puts rv_obj.title

# ===========================

files_id = 53
rv_client.delete_file(files_id)
puts 'File deleted'

# ===========================

path_to_file = '../spec/test_files/polarBear.jpg'
object_type_id = 6 # Property
object_id = 32 # Property ID

rv_file = rv_client.upload_file(path_to_file, object_type_id, object_id)
