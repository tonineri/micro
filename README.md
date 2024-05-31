![micro](/.design/logo.png)

![Divider](/.design/divider.png)

## Description

Micro is a minimalist and optimized Docker base image built on `Ubuntu 24.04`. It is designed to be lightweight and efficient, providing a solid foundation for building your own containerized applications.

![Divider](/.design/divider.png)

## Features

- Based on **Ubuntu 24.04**
- **Minimalist** design with **essential** tools and utilities
- Optimized for **performance** and **size**
- Includes `syslog-ng` and `logrotate` for **logging**
- Configured with **secure** defaults

![Divider](/.design/divider.png)

## Getting Started

To use the Micro base image, you can pull it from Docker Hub and use it as the base for your own Dockerfiles.

```dockerfile
FROM antonioneri/micro:latest
# Add your application setup here
```

![Divider](/.design/divider.png)

## Environment Variables

Micro provides the following environment variables for configuration:

```sh
ENV DEBIAN_FRONTEND="noninteractive"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US:en"
ENV LC_ALL="en_US.UTF-8"
```

![Divider](/.design/divider.png)

## Logging

Micro uses `syslog-ng` for logging combined with `logrotate`. The configuration is optimized for Docker environments, ensuring logs are properly managed and rotated.

### Syslog-ng

`syslog-ng` configuration can be found in [syslog-ng.conf](/container/services/syslog-ng/syslog-ng.conf).

### Logrotate

`logrotate` configuration can be found in [logrotate.conf](/container/services/syslog-ng/logrotate). Current configuration:

- Rotates logs **weekly**
- Keeps **4 weeks** of backlogs
- **Creates** new logs after rotating old ones

![Divider](/.design/divider.png)

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

![Divider](/.design/divider.png)

## License

Micro is licensed under the MIT License. See [LICENSE](LICENSE) for more information.

![Divider](/.design/divider.png)

## Acknowledgments

This project was inspired by various minimal base images and optimized Docker practices. Special thanks to the contributors of the open-source tools and libraries used in this project.

![Divider](/.design/divider.png)