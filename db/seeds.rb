puts Rails.env.downcase

# load the correct seeds file for our Rails environment
load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))
