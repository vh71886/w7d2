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
        * keep anchor tags
            - make links look like buttons using background color and border-radius
        * add nice form alignment and spacing

## Phase 1: Band/Album/Track
Build inventory system
    * Migrations
    * Model definition
    * Routes
    * Controller
    * Views

### Bands schema
* name:string  null: false

Other items for bands
* Routes: all routes
* Views

In order to test using Postman we will need to disable CSRF protection. 
Add the following line right underneath the line config.load_defaults 5.2 in config/application.rb. 
Remember, this should only be done while we are working in development.
```
# config/application.rb
config.action_controller.default_protect_from_forgery = false
``` 

Add CSRF protection to the project
    * Remove line (shown above)
    * Add authenticity token to all forms

### Albums schema
* band_id:integer   null:false, unique: true
* year:integer      null:false
* title:stsring     null:false
* studio:boolean    null:false, default: true

Just for fun: make album titles unique to the band 

Create models, controllers, routes, and views
 * routes: nested (see below)

```
new_band_album GET    /bands/:band_id/albums/new(.:format)   albums#new
        albums POST   /albums(.:format)                      albums#create
    edit_album GET    /albums/:id/edit(.:format)             albums#edit
         album GET    /albums/:id(.:format)                  albums#show
               PATCH  /albums/:id(.:format)                  albums#update
               PUT    /albums/:id(.:format)                  albums#update
               DELETE /albums/:id(.:format)                  albums#destroy
```

* New/edit: 
    * Dropdown to select Band
    * Radio buttons to select Studio/Live
        - Default value - use checked in HTML tag
* Show:
    * Link back to Band
    * Include Edit and Delete buttons

Update Band#show
* List and link to all albums
* Add ability to add album

### Tracks Schema
* album_id:integer      null:false, unique:true
* title:string          null:false
* ord:integer           null:false, unique:true (track number)
* lyrics:text           optional:true
* bonus:boolean         null:false, default: false

Create models, controllers, routes, and views
* routes (see below) - includes nested
* lyrics optional - validation/association

```
new_album_track GET    /albums/:album_id/tracks/new(.:format) tracks#new
         tracks POST   /tracks(.:format)                      tracks#create
     edit_track GET    /tracks/:id/edit(.:format)             tracks#edit
          track GET    /tracks/:id(.:format)                  tracks#show
                PATCH  /tracks/:id(.:format)                  tracks#update
                PUT    /tracks/:id(.:format)                  tracks#update
                DELETE /tracks/:id(.:format)                  tracks#destroy
```

* new/edit: 
    * dropdown to select Album
    * radio buttons for bonus/regular track
    * textarea for lyrics
* show:
    * links or buttons to album, edit, delete
* Update album to show and add tracks

Models
* remember associations, validations, dependent:destroy, etc.