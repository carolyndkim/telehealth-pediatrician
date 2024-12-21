# Telehealth Pediatrician

This app is a very simple mockup of a pediatrician practice focused on teleheatlh. This was built following the [Turbo Rails Tutorial](https://www.hotrails.dev/turbo-rails) and then expanded to include additional functionalities. 

## Setup
```
# clone this app
git clone git@github.com:carolyndkim/telehealth-pediatrician.git

# precompile assets
rake assets:precompile

# build the rails server
bundle exec rails s
```

## Functionalities 
Currently, there are three main feature sets: 
1. Parents:
- Add, edit, delete parents 
- For each parent:
    - Add, edit, delete, children
    - Add, edit, delete a visit request  
    - See the total number of visits

2. Visits: 
- Assign any waiting visits to a physician 
- See the total number of waiting visits

3. Physicians: 
- Add, edit, delete physicians
- For each physician:
    - Mark any waiting visits as finished
    - See the total number of assigned visits 

The main page has links to the three pages, each page listing parents, visits, or physicians. 

See [this Google doc](https://docs.google.com/document/d/1PWiKseRMuw1i1nqJKRy41lTVCdJrnoMha-o-KMhSHgk/edit?usp=sharing) for screenshots of the above functionalities. 

## Future Features
Below will be added in the future: 
- Unit Tests and Database Seeding
- Authentication for each parent, physician, and admin
- Broadcasts with Turbo Streams for physicians and admins
