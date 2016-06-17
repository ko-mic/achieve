module ApplicationHelper
    
    def profile_img(user)
        if user.provider == 'facebook'
            img_url = "https://graph.facebook.com/#{user.uid}/picture?type=small"
        elsif user.provider == 'twitter'
            img_url = "http://furyu.nazo.cc/twicon/#{user.name}"
        else
            img_url = '/images/default_user_image.jpeg'
        end
        image_tag(img_url, alt: user.name)
    end
end
