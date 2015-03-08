# Load the Rails application.
require File.expand_path('../application', __FILE__)


# Initialize the Rails application.
Rails.application.initialize!

Paperclip::Attachment.default_options[:url] = 'travel123.s3.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'