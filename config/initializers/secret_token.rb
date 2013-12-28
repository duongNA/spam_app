# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SpamApp::Application.config.secret_key_base = 'a86443a5f569cd1216d32c88e1df54491c86935b318ca232b4731cd6e95ded85a716b04ef3f1b5157b2fa4115df004ad96b5cc2a9acb3539e07e92dcb870311f'

require "securerandom"

def secure_token
	token_file = Rails.root.join('.secret');
	if File.exist?(token_file)
		# use the existing token
		File.read(token_file).chomp
	else
		# generate a new token and store it in token file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SpamApp::Application.config.secret_key_base = secure_token
