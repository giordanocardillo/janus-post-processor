# Janus Recordings Post Processor

This is a utility from [Janus](https://janus.conf.meetecho.com/) team to convert mjr files created with Janus to standard formats.

This version of the utility ships as Docker container so it needs docker to run, if you have compiled Janus by yourself and want to use this utility,
please reconfigure it using `--enable-post-processing`, then recompile, and will find the utility under `/opt/janus/bin/janus-pp-rec`.

 
## Usage

1. Download `run.sh` file
2. Move it to `/usr/local/bin/janus-pp-rec`
3. Make sure it is executable `chmod a+x /usr/local/bin/janus-pp-rec`
4. Launch it! 

The first time it will download the container (It is something about 40 MB, it contains also full ffmpeg) then run the utility

