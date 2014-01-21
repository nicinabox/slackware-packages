# Slackware Packages API

This API covers Slackware versions 13.1-current (14.1 at this time). Includes standard package versions and patch versions.

All endpoints return json.

## Endpoints

**/slackwares**

List of all Slackware versions

**/slackwares/:id**

List of packages for a Slackware version (`:id`)

**/packages**

List of all packages for all Slackware versions

**/packages/:id**

Package details for `:id`. Also supports slugged name.
