#!/bin/sh
set -e

FILES=./*video.mjr
i=1

if [ ! -x "$(command -v ffmpeg)" ]; then
  printf "\033[31mERROR\033[0m This script requires \033[1mffmpeg\033[0m\n"
  exit 1
fi

if [ ! -x "$(command -v janus-pp-rec)" ]; then
  printf "\033[31mERROR\033[0m This script requires \033[1mjanus-pp-rec\033[0m\n"
  exit 1
fi

if [ ! -d /tmp/janus-recordings ]; then
  mkdir /tmp/janus-recordings
fi

set +e
for video in $FILES
do
  filename=$(echo $video | awk -F"-" '{print $1"-"$2"-"$3"-"$4"-"$5}')
  if [ -f $filename"-audio.mjr" ]; then
    printf "\033[36mProcessing\033[0m $filename"
    printf "  -> \033[35mExtracting video\033[0m"
    janus-pp-rec $video /tmp/janus-recordings/video.webm >/dev/null 2>&1
    RESULT=$?
    printf "  -> \033[35mExtracting audio\033[0m"
    janus-pp-rec $filename"-audio.mjr" /tmp/janus-recordings/audio.opus >/dev/null 2>&1
    RESULT=$?
    printf "  -> \033[33mMerging\033[0m"
    ffmpeg -i /tmp/janus-recordings/audio.opus -i /tmp/janus-recordings/video.webm -y -c:v copy -c:a copy $filename.webm  >/dev/null 2>&1
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
      rm -rf /tmp/janus-recordings/video.webm
      rm -rf /tmp/janus-recordings/audio.opus
      rm -rf "$filename"*.mjr
      printf "  -> \033[32mComplete\033[0m"
    else
      rm -rf "$filename"*.webm
      FAILED[$i]=$filename
      $i++
      printf "  -> \033[31mFailed\033[0m"
    fi
    echo
  fi
done
printf "\033[36mFinished processing\033[0m\n"
if [[ ${FAILED[@]} ]]; then
  echo -e "\033[31mFailed converting following recordings\033[0m"
  printf '  %s\n' "${FAILED[@]}"
  echo
fi
