# Micro

![micro](./design/logo.png)

Micro is a minimalist and optimized Docker base image built on `Ubuntu 24.04`. It is designed to be lightweight and efficient, providing a solid foundation for building your own containerized applications.

![Divider](./design/divider.png)

## Features

- Based on Ubuntu 24.04
- Minimalist design with essential tools and utilities
- Optimized for performance and size
- Includes `syslog-ng` daemon for logging
- Configured with secure defaults

![Divider](./design/divider.png)

## Getting Started

To use the Micro base image, you can pull it from Docker Hub and use it as the base for your own Dockerfiles.

```dockerfile
FROM antonioneri/micro:latest
# Add your application setup here
```

![Divider](./design/divider.png)

## Environment Variables

Micro provides the following environment variables for configuration:

```sh
ENV DEBIAN_FRONTEND="noninteractive"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US:en"
ENV LC_ALL="en_US.UTF-8"
```

![Divider](./design/divider.png)

## Logging

Micro uses `syslog-ng` for logging. The configuration is optimized for Docker environments, ensuring logs are properly managed and rotated.

![Divider](./design/divider.png)

### Syslog-ng Configuration

Syslog-ng is configured with the following options:

```conf
@include "scl.conf"
options {
    chain_hostnames(off);
    flush_lines(0);
    use_dns(no);
    use_fqdn(no);
    dns_cache(no);
    owner("root");
    group("adm");
    perm(0640);
    stats(freq(0));
    bad_hostname("^gconfd$");
};

source s_src {
    unix-dgram("/dev/log");
    internal();
};

destination d_syslog { file("/var/log/syslog"); };
log { source(s_src); destination(d_syslog); };
```

![Divider](./design/divider.png)

### Logrotate Configuration

Micro includes `logrotate` to manage log file sizes and ensure logs are rotated regularly.

```conf
# Rotate log files weekly
weekly

# Keep 4 weeks of backlogs
rotate 4

# Create new log files after rotating old ones
create

# Include package-specific logrotate configurations
include /etc/logrotate.d
```

![Divider](./design/divider.png)

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

![Divider](./design/divider.png)

## License

Micro is licensed under the MIT License. See [LICENSE](LICENSE) for more information.

![Divider](./design/divider.png)

## Acknowledgments

This project was inspired by various minimal base images and optimized Docker practices. Special thanks to the contributors of the open-source tools and libraries used in this project.

![Divider](./design/divider.png)