# cpu-Lock
Lock a terminal command to the efficiency or performance cores on a big.LITTLE ARM processor (Designed for Apple Silicon).

## Usage
Download the precompiled binary from the [releases](https://github.com/BitesPotatoBacks/CPU-Lock/releases) and run it in the terminal like so: `./cpulock -c "your command here"`

Available command line options are:
```
    -e           : lock command to effeciency cores (default)
    -p           : lock command to performance cores
    -l <string>  : set command launch path (default is "/bin/bash")
    -c <string>  : insert command to run
    -h           : help
```
If you would like to add the binary to your `usr/local/bin/`, you may run the following: `sudo cp ./cpulock /usr/local/bin`

## Example
In testing `./cpulock` wih my [M1cpufreq](https://github.com/BitesPotatoBacks/M1-CPU-Frequency) command:

`./cpufreq -ec "M1cpufreq -m"` (which locked the script to the M1 effciiency cores) outputted 2064 mHz

`./cpufreq -pc "M1cpufreq -m"` (which locked the script to the M1 performance cores) outputted 3090 mHz

These outputs fall in line with the description of the maximum efficiency and performance core clock speeds on the M1 CPU.
 
 
 ## Known Issues
 Locking commands that constantly output data, such as `powermetrics`, cannot be stopped using control-c. The only way to stop the command is to close the terminal window it's being ran in. This issue is crrently under investigation.
 
 ## Bugs and Issues
 If you can't diagnose the problem yourself, feel free to open an Issue. I'll try to figure out what's going on as soon as possible.
