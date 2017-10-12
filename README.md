# Janus Recordings Post Processor

This is a utility from [Janus](https://janus.conf.meetecho.com/) team to convert mjr files created with Janus to standard formats.

I am not associated in any way with Janus or Meetecho, I'm just providing this tool.

This version of the utility ships as Docker container so it needs docker to run, if you have compiled Janus by yourself and want to use this utility,
please reconfigure it using `--enable-post-processing`, then recompile, and will find the utility under `/opt/janus/bin/janus-pp-rec`.

### `janus-pp-rec` file

The provided `janus-pp-rec` executable file has been compiled under alpine linux 3.6 so this docker image is based on that OS.
 
## Usage

1. Download `run.sh` file
2. Move it to `/usr/local/bin/mjr2webm`
3. Make sure it is executable `chmod a+x /usr/local/bin/mjr2webm`
4. Launch it inside recordings folder
5. Enjoy your webms! 

#### In one line 

```
curl --fail -L https://github.com/giordanocardillo/janus-post-processor/releases/download/1.0/mjr2webm > /usr/local/bin/mjr2webm && chmod a+x /usr/local/bin/mjr2webm
```

The first time it will download the container (It is something about 40 MB, it contains also full ffmpeg) then run the utility
