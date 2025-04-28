# Docs

## Architecture
- 3 Layer Architecture including Presentation, Application and Data Layer.
- Communication utilizing REST API.

### Presentation Layer
- Built on top of React Framework in Typescript language.
- Mainly uses Tailwind and Daisy UI for styling.
- Utilized React Router DOM for SPA internal routing.
- Directory and Files in (/src):
    - components : storing all reuseable components.
    - hooks : storing all global reuseable functions including cookies, api fetching etc.
    - pages : storing all pages in the application. (pagename/page.tsx)
    - app.tsx : main routing component.
    - config.tsx : stores environment variables.
    - index.css : main css file for global css styling.
    - main.tsx : main entry file.
- Hosted on Google Firebase platform.

### Application Layer
- Built on top of FastAPI library in Python language and run by uvicorn for small and fast application.
- Directory and Files in (/app):
    - middlewares : storing all middleware and interceptor functions.
    - routers : storing all routers.
    - config.py : stores environment variables.
    - database.py : storing database configurations.
    - main.py : main entry file.
- Hosted on Google Cloud VM.

### Data Layer
- Hosted on Google Cloud VM (Dockerized).
- Configurations in docker-compose.yaml file.

#### Database
- Uses MySql database.
- Table Overview :
    - classes : store classes/courses information.
    - colleges : store colleges information.
    - majors : store majors information.
    - majors_subject : store subjects for each major.
    - notifications : store notification information that will be displayed on the right of the ui.
    - parameters : store configurations.
    - results : store student exam results.
    - subjects : store subjects information.
    - teacher_information : store teachers information.
    - user_auth : store users password.
    - user_information : store students information.
- For database schema and diagram, feel free to connect to the database using DBeaver.

#### File Storage
- Uses MinIO storage.
- All pictures stored in the MinIO picture bucket.

## Disclaimer
- Security and Reliability of the application is limited as its for assignment purpose.
- For instance, the application does not implement password hashing, ip blocking, spam prevention features.
- Environment are stored in config files rather than in .env files as it is more convenient in code sharing.
- Code repository is in public for convenient code sharing as well.

## Work been done
- Requirements analysis.
- High-level architecture design and engineering.
- Database design and implementation including but not limited to tables, views etc.
- Backend endpoints engineering, design and implementation.
- Backend and Database integrations.
- Frontend UI/UX Design.
- Frontend and Backend endpoints engineering.
- HTTPS Server setup, including but not limited to reverse proxy, tls certifications, firewall rules, port forwarding etc.
- DNS setup in domain provider platform.
- Simple documentations.