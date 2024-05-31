<div align="center">

![micro](/.design/logo.png)

# `Tiny But Mighty` 📦

</div>

![Divider](/.design/divider.png)

## Description

**micro** is a minimalist and optimized Docker base image built on `Ubuntu 24.04`. It is designed to be lightweight and efficient, providing a solid foundation for building your own containerized applications.

![Divider](/.design/divider.png)

## Features

**micro** includes only the essential components needed for a streamlined, efficient Docker base image:

- Based on `Ubuntu 24.04 LTS` as the base system 🐧
- A correct `init` process 🏁
- Fixes for `apt` incompatibilities with Docker 🔧
- Logging with`syslog-ng` and `logrotate` 📜
- Scheduled tasks with `cron`⏰
- Service supervision and management with `runit` 👷

![Divider](/.design/divider.png)

## Getting Started

To use the **micro** base image, you can pull it from Docker Hub and use it as the base for your own Dockerfiles.

```dockerfile
FROM antonioneri/micro:latest
# Add your application setup here
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