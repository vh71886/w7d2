# Music App

## Learning Goals
* Be able to build User Auth without looking at old code or demos
* Know how to nest routes
* Be able to link between different views using a tags and rails URL helpers
* Be able to trigger controller actions from views using forms and links
* Know how to check that a current user exists before displaying content
- Throughout this project, do not use form_for.

## Warmup: Authentication
User
* Make model, table, controller, views, routes, etc.
    - validations
    - paths
    - constraints, restrictions
* Table schema 
    - email: string             null: false, unique: true
    - password_digest: string   null: false
    - session_token: string     null: false, unique: true
    * index email and session_token
* Create new user, log in, log out, restrict access, etc.
    * User model
        - User::generate_session_token
        - User#reset_session_token!
        - User#ensure_session_token
        - User#password=(password)
        - User#is_password?(password)
        - User::find_by_credentials(email, password)
    * Users controller
        - new
        - create
            - user should be logged in automatically after sign-up
        - show
    * Sessions controller
        - new
        - create
            - session_token should be reset for user
        - destroy
    * Applications controller
        - helper_method
        - current_user
        - logged_in?
        - log_in_user!(user)
            - resets the session_token and cookie for the user
* Create views
    * application.html.erb
        - logged in
            - user sees sign out link
        - logged out
            - user sees sign up link
            - user sees sign in link
    * styling
        * application.html.erb
            - "Music App" header with fun font
        * display login/out info on the right side of the header
            - flex
        * keep <a> tags
            - make links look like buttons using background color and border-radius
        * add nice form alignment and spacing

## Phase 1: Band/Album/Track
