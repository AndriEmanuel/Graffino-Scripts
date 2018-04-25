#!/bin/bash
startrecording() {
  echo "This program will record everything you type and echo the output into a script file. To stop recording type stoprecording"
}
stoprecording() {
  lastStart=($(history | grep -P "[0-9]+[*]?[\s]+startrecording" | tail -1));
  startIndex=$(($startInstances[-2]+1));
  lastStop=($(history | tail -1));
  stopIndex=$(($stopInstances[-2]));
  echo "Finished recording"
  echo -n "Enter the filename:"
  read filename
  fc -ln $lastStart $lastStop > ${filename/\~/$HOME}
}
