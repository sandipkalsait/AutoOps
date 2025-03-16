# Script Details
Automated execution of script per week.

## Configuration Changes
To apply new configuration changes, modify the `config.cfg` file located at:
```
path: config/config.cfg
```

The script will first fetch all configurations from `config.cfg`. If not found, it will check the default configuration at:
```
path: config/config.cfg.defaults
```
All configurations are at the base level.

- **Day of execution**: Default is Monday (DAY (1..7): 1 is Monday)
- **Time of execution**: 08:00:00
## Script Usage
This script can be managed using the following commands:

- **Start the script**: `./script-launcher.sh start`
- **Stop the script**: `./script-launcher.sh stop`
- **Terminate the script**: `./script-launcher.sh kill`
- **Check usage**: `./script-launcher.sh`
