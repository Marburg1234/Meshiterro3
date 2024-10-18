# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
Rails.application.config.file_mime_types = {
  'image/png' => %w(png),
  'image/jpeg' => %w(jpg jpeg),
  'image/gif' => %w(gif)
}