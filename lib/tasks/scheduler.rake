namespace :update do
    task :link => :environment do
        link = Link.where(user_id: 1)
        link.update_column(:view, link.view + 1)
    end
end