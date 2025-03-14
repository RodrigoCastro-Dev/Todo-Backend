# Todo-Backend
This is a back-end API-only application built with Ruby on Rails, using PostgreSQL as the database. It includes authentication via Devise-JWT and exposes a GraphQL API for managing tasks with authentication and filtering capabilities.

## Features

-   **Authentication:** Devise-JWT for secure login, sign-up, and token-based authentication.
-   **GraphQL API:** CRUD operations for tasks.
    -   Tasks can be filtered by **completed status** and **description**.
    -   Only authenticated users can interact with the API.
-   **Dockerized Deployment:** Easily deployable via Docker.
-   **PostgreSQL Database:** Used for data persistence.

##  Setup Instructions

### **Running Locally with Docker Compose**

Make sure you have Docker and Docker Compose installed, then follow these steps:

1.  Clone the repository:
    
    ```sh
    git clone <repository-url>
    cd todo-backend
    ```
    
2.  Create a `.env` file with the required environment variables:
    
    ```sh
    DATABASE_PASSWORD=<your_db_password>
    DATABASE_USERNAME=<your_db_username>
    DATABASE_HOST=<your_db_host>
    RAILS_ENV=development
    DATABASE_URL=<your_database_url>
    RAILS_MASTER_KEY=<your_master_key>
    ```
    
3.  Start the application:
    
    ```sh
    docker-compose up --build
    ```

### **Deployment on Render**

To deploy the back-end on Render:

1.  Create a **PostgreSQL database** on Render.
2.  Create a **new web service** on Render.
3.  Select **Docker** as the deployment method.
4. Add Database environment variables based on **PostgreSQL database** created on Render.
5.  The `Dockerfile` is already configured for deployment.

##  API Endpoints
-   **Authentication (RESTful):** Sign-in, sign-up, and login using Devise-JWT.
-   **Task Management:** Full CRUD operations via GraphQL.
-   **Filtering:** Retrieve tasks based on their completed status and description via GraphQL.

##  Tech Stack
-   Ruby on Rails (API only)
-   PostgreSQL
-   RestfulAPI
-   GraphQL
-   Devise-JWT (Authentication)
-   Docker & Docker Compose
----------
