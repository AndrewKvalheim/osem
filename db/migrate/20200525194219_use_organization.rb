class UseOrganization < ActiveRecord::Migration[5.2]
  def up
    name = ENV['OSEM_NAME']
    raise 'expected OSEM_NAME' unless name

    organization = Organization.find_by(description: 'Default organization')
    raise 'expected default organization' unless organization

    # Adapt the default organization
    puts "Renaming organization #{organization.name.inspect} to #{name.inspect}"
    organization.name = name
    organization.save!

    # Promote the latest conference organizers to organization administrators
    Conference.first.roles.find_by(name: 'organizer').users.each do |user|
      puts "Adding role organization_admin to user #{user.name.inspect}"
      user.add_role :organization_admin, organization
    end
  end
end
