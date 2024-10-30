# Changelog

## [1.0.0] - 2024-10-28

### Added
- Initial release of the Security Group Monitoring module.
- Support for monitoring AWS Security Groups with custom CloudWatch metric filters and alarms.
- Configurable parameters for Security Group IDs, event names, and CloudWatch log settings.
- Automatic creation of CloudWatch metric filters based on specified Security Groups and their respective events.
- Alarms triggered based on defined thresholds for specific Security Group events.
- Detailed variable descriptions for easy customization and configuration.

### Changed
- Updated Terraform examples in [`README.md`](README.md) to reference the module source from the Terraform Registry.
