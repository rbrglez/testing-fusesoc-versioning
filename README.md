# Testing Fusesoc Versioning


## Prerequesites

Before using this repository, make sure that FuseSoC is installed on your system. 


## How to use

This repository contains several bash scripts that act as wrappers for FuseSoC commands. These scripts facilitate testing different versions of the Open-Logic library and running associated tests. Here's a quick overview of the available scripts:

- `init_*.sh`: Initializes the environment with the specified configuration.
- `run_*.sh`: Executes FuseSoC with a specified target.
- `clean.sh`: Cleans up the environment by removing generated files and caches.


## Examples

### Example 1

Check out what happens if development version and release version with identical version is initialized.

```bash
./init_development_olo_3.2.0.sh
./init_release_olo_3.2.0.sh
./init_test_target_core.sh
fusesoc core list
```

```bash
$ fusesoc core list
WARNING: Replacing open-logic:open-logic:intf:3.2.0 in development-cores/open-logic-3.2.0/src/intf with the version found in /home/rbrglez/Documents/local/testing-fusesoc-versioning/release-cores/open-logic-3.2.0
WARNING: Replacing open-logic:open-logic:axi:3.2.0 in development-cores/open-logic-3.2.0/src/axi with the version found in /home/rbrglez/Documents/local/testing-fusesoc-versioning/release-cores/open-logic-3.2.0
WARNING: Replacing open-logic:open-logic:base:3.2.0 in development-cores/open-logic-3.2.0/src/base with the version found in /home/rbrglez/Documents/local/testing-fusesoc-versioning/release-cores/open-logic-3.2.0

Available cores:

Core                                         Cache status  Description
================================================================================
::test-target:0.1.0                         :      local : Dummy target
open-logic:open-logic:axi:3.2.0             :      empty : official release; axi core; 3.2.0
open-logic:open-logic:base:3.2.0            :      empty : official release; base core; 3.2.0
open-logic:open-logic:intf:3.2.0            :      empty : official release; intf core; 3.2.0
open-logic:tutorials:quartus_tutorial:3.2.0 :      local : quartus tutorial for open-logic, targetting DE0-CV board
open-logic:tutorials:vivado_tutorial:3.2.0  :      local : vivado tutorial for open-logic, targetting Zybo Z7-10 board
```

```bash
./init_release_olo_3.2.0.sh
./init_development_olo_3.2.0.sh
./init_test_target_core.sh
fusesoc core list
```


```bash
$ fusesoc core list
WARNING: Replacing open-logic:open-logic:base:3.2.0 in /home/rbrglez/Documents/local/testing-fusesoc-versioning/release-cores/open-logic-3.2.0 with the version found in development-cores/open-logic-3.2.0/src/base
WARNING: Replacing open-logic:open-logic:axi:3.2.0 in /home/rbrglez/Documents/local/testing-fusesoc-versioning/release-cores/open-logic-3.2.0 with the version found in development-cores/open-logic-3.2.0/src/axi
WARNING: Replacing open-logic:open-logic:intf:3.2.0 in /home/rbrglez/Documents/local/testing-fusesoc-versioning/release-cores/open-logic-3.2.0 with the version found in development-cores/open-logic-3.2.0/src/intf

Available cores:

Core                                         Cache status  Description
================================================================================
::test-target:0.1.0                         :      local : Dummy target
open-logic:open-logic:axi:3.2.0             :      local : dummy axi description 3.2.0. This is development version!
open-logic:open-logic:base:3.2.0            :      local : dummy base description 3.2.0. This is development version!
open-logic:open-logic:intf:3.2.0            :      local : dummy intf description 3.2.0. This is development version!
open-logic:tutorials:quartus_tutorial:3.2.0 :      local : quartus tutorial for open-logic, targetting DE0-CV board
open-logic:tutorials:vivado_tutorial:3.2.0  :      local : vivado tutorial for open-logic, targetting Zybo Z7-10 board

```

You can see that depending upon which version was last added to library is active.

### Example 2

It seems that versions with the -dev suffix do not work as expected. Specifically, the following commands lead to FuseSoC entering an infinite loop:

```bash
./init_development_olo_3.2.0-dev.sh
./init_test_target_core.sh
./run_base_test_target.sh
```