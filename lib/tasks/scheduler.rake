namespace :update do
    task :link => :environment do
        REDIS.keys.each do |key|
            link = Link.where(short: key)
            link.update_all(view: REDIS.get(key))
            REDIS.del(key)
        end
    end
end