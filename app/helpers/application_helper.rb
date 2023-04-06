module ApplicationHelper

    def login_helper style = ''
        if current_user.is_a?(GuestUser)
            (link_to 'Log In', new_user_session_path, class: style ) +
            " ".html_safe +
            (link_to 'Sign Up', new_user_registration_path, class: style)
         else 
            button_to 'Logout', destroy_user_session_path, method: :delete, class: style 
        end 
    end

    def source_helper(layout_name)
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end

    def copyright_generator
        PersonalViewTool::Renderer.copyright 'Homer J.', 'All rights reserved'
    end
end
