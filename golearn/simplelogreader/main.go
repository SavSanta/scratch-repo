package main

import (
	"os"
	"log"
	"bufio"
	"fmt"
	"strings"
        "flag"

)

func main() {

	path := flag.String("path", "myapp.log", "The path to the log file")
	level := flag.String("level", "ERROR", "The level of error to hunt for DEBUG, INFO, ERROR or CRITICAL")

	flag.Parse()

	f, err := os.Open(*path)

	if err != nil {

		log.Fatal(err)
	}
	defer f.Close()

	r := bufio.NewReader(f)
	for {
		s, err := r.ReadString('\n')
		if err != nil {
			break
		}
		if strings.Contains(s, *level) {
			fmt.Println(s)
		}

	}


}
