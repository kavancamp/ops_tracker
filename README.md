# OpsTracker

A full-stack Ruby on Rails application for managing operational assets across distributed locations. Users can create, update, and track assets, assign them to locations, and monitor their status.

## Features
Create and manage locations
Track assets (type, serial number, status)
Assign assets to specific locations
Edit and update records with full CRUD workflows
Server-rendered UI with Bootstrap styling
Flash messaging for user feedback

## Why I Built This

This project simulates a real-world operational platform used by companies managing equipment across multiple sites.
It focuses on:
backend data modeling
relational database design
scalable CRUD workflows
clean UI integration with backend logic

## Tech Stack
#### Backend
- Ruby on Rails
- PostgreSQL
#### Frontend
- ERB templates
- Bootstrap 5
#### Other
- ActiveRecord (ORM)
- RESTful routing
- Git & GitHub
- CI with GitHub Actions
- RuboCop for linting
## Data Model
### Location
- name
- region
### Asset
- name
- asset_type
- serial_number
- status
- belongs_to :location

## Setup Instructions
1. Clone repo
```bash
    git clone https://github.com/YOUR_USERNAME/ops_tracker.git
    cd ops_tracker
```
2. Install dependencies
```bash
  bundle install
```
3. Setup database
```bash
  bin/rails db:create
bin/rails db:migrate
```
4. Run server
```bash
bin/rails server
```
Visit:
``` http://localhost:3000 ```

##  Run Tests
```bash bin/rails test```

## Key Design Decisions
1. RESTful Routing
Used Rails resource routing for clean, predictable endpoints and scalability.

2. Form Partials
Extracted reusable form components to avoid duplication between new and edit views.

3. Relational Data Modeling
Used PostgreSQL with proper foreign key relationships to model real-world asset ownership.

4. MVC Separation
Kept business logic in models, request handling in controllers, and presentation in views.

5. Route Conflict Debugging
Resolved a routing conflict with Rails’ /assets path by mapping asset routes to /equipment, demonstrating awareness of framework internals.

### 🚧 Future Improvements
- Add maintenance records for assets
- Add authentication (users/accounts)
- Add API endpoints for external integrations
- Add search/filtering for assets
- Add pagination for scalability
