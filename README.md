# systemd

#### Table of Contents

1. [Overview](#overview)
2. [Setup - The basics of getting started with systemd](#setup)
    * [What systemd affects](#what-systemd-affects)
3. [Requirements - Module requirements](#eequirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Unlicense - This module is Unlicensed](#unlicense)
8. [Contributing - Guide for contributing to the module](#development)

## Overview

This module aims to automate all systemd related functionality.
Currently implemented is only configuration for hostname, locale, timezone.

## Setup

### What systemd affects

Systemd module makes sure that systemd is installed and allows configuring hostname, locale and timezone.

## Requirements

* Puppet 3.5 or later
* `trusted_node_data = true` set in `puppet.conf`


## Usage

For just installing systemd, use
`include systemd`

To configure hostname:
`include systemd::hostname`

To configure locale:
`include systemd::locale`

To set timezone:
`include systemd::timezone`

All options can be specified with Hiera

```
systemd::hostname::hostname: somehost
systemd::locale::locale: en_US.utf8
systemd::locale::keymap: us
systemd::timezone::timezone: America/New_York
systemd::timezone::local_rtc: false
systemd::timezone::use_ntp: true
```

## Reference

* `manifests/init.pp`
* `manifests/params.pp`
* `manifests/hostname.pp`
* `manifests/locale.pp`
* `manifests/timezone.pp`

## Limitations

Currently have been tested only on Archlinux and Gentoo

## Unlicense

![Copyright-Free](http://unlicense.org/pd-icon.png)

All text, documentation, code and files in this repository are in public domain (including this text, README).
It means you can copy, modify, distribute and include in your own work/code, even for commercial purposes, all without asking permission.

[About Unlicense](http://unlicense.org/)

## Contributing

Feel free to improve anything.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


**Warning**: By sending pull request to this repository you dedicate any and all copyright interest in pull request (code files and all other) to the public domain. (files will be in public domain even if pull request doesn't get merged)

Also before sending pull request you acknowledge that you own all copyrights or have authorization to dedicate them to public domain.

If you don't want to dedicate code to public domain or if you're not allowed to (eg. you don't own required copyrights) then DON'T send pull request.

