# Simple Maintenance Page with Bitnami Nginx and Docker

![Maintenance Banner](https://img.shields.io/badge/Maintenance-Mode-red)

## Goal

The goal of this project is to provide a **simple**, **secure**, and **customizable** maintenance page using **Bitnami
Nginx** within a **Docker** container. This setup allows organizations to display a professional maintenance message to
users during scheduled downtimes or unexpected outages, ensuring clear communication and enhancing user experience.

**Key Objectives:**

- **Ease of Deployment:** Quickly deploy the maintenance page using Docker and Docker Compose.
- **Customization:** Dynamically customize the page title, maintenance message, contact email, and team message via
  environment variables.
- **Security:** Run the Nginx server as a non-root user and implement essential security headers.
- **User Experience:** Support both Dark and Light modes to adapt to user preferences.

## Environment Variables

The maintenance page can be customized using the following environment variables. These variables replace corresponding
placeholders in the `index.html` file at runtime.

| Variable        | Description                                           | Default Value                                                                                                    |
|-----------------|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| `TITLE`         | Sets the page title displayed in the browser tab.     | "We'll Be Back Soon!"                                                                                            |
| `MESSAGE`       | The main maintenance message shown to users.          | "Sorry for the inconvenience but we're performing some maintenance at the moment. We'll be back online shortly!" |
| `CONTACT_EMAIL` | Contact email address for user inquiries.             | "support@example.com"                                                                                            |
| `TEAM_MESSAGE`  | The team message displayed at the bottom of the page. | "BBMRI-ERIC IT Team"                                                                                             |

## Example

Below is a sample `compose.yaml` file that sets up the maintenance page with customized environment variables. This file
simplifies the process of building and running the Docker container.

```yaml
services:
  maintenance:
    image: ghcr.io/bbmri-eric/maintenance-page:latest
    ports:
      - "8080:8080"
    container_name: simple-maintenance-page
    restart: unless-stopped
    environment:
      TITLE: "We'll Be Back Soon!"
      MESSAGE: "Sorry for the inconvenience but we're performing some maintenance at the moment. We'll be back online shortly!"
      CONTACT_EMAIL: "support@yourdomain.com"
      TEAM_MESSAGE: "BBMRI-ERIC IT Team"
```
> [!TIP]
> This setup integrates seamlessly with [Traefik](https://traefik.io/) by configuring both the maintenance container and your web application container to use the same route path. To prioritize the maintenance container, add the label traefik.http.routers.maintenance.priority=1 to it. Additionally, ensure that the web application container has a similar label with a higher priority value.
 ```yaml
 # Maintenance Container
 labels:
    - "traefik.http.routers.maintenance.rule=Path(`/your-route`)"
    - "traefik.http.routers.maintenance.priority=1"

# Web Application Container
labels:
    - "traefik.http.routers.webapp.rule=Path(`/your-route`)"
    - "traefik.http.routers.webapp.priority=2"  # Higher priority
```

## License

Copyright 2020-2024 [BBMRI-ERIC](https://bbmri-eric.eu).

Licensed under GNU Affero General Public License v3.0 (the "License");
you may not use this file except in compliance with the License.

Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied. See the License for the specific language governing permissions and limitations under the
License.