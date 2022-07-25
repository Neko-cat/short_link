namespace :update do
    task :link => :environment do
        REDIS.keys.each do |key|
            link = Link.find_by(short: key)
            if link 
                link.update_column(:view, REDIS.get(key))
                REDIS.del(key)
            end
        end
    end
end