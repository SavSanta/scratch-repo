package main

import (

	"fmt"
	"log"
	"math/rand"
	"os"
	"time"
	"runtime/trace"

)

func main() {

	f, err := os.Create("trace.out")
	if err != nil {
		// Notice the use of Fatalf() to pass in variables
		log.Fatalf("We did not create a trace file! %n\n", err)
		}
	defer func() {
		if err := f.Close(); err != nil {
			log.Fatalf("Failed to Close trace file %v\n", err)
		}
	}()

	if err := trace.Start(f); err != nil {
		log.Fatalf("We failed to start a trace: %v\n", err)
	}

	defer trace.Stop()

	AddRandomNumbers()
}


func AddRandomNumbers() {

	firstNumber := rand.Intn(100)
	secondNumber := rand.Intn(100)

	time.Sleep(3 * time.Second)

	var result = firstNumber * secondNumber
	fmt.Printf("Result of 2 numbers is %d", result)
}

//
//
// After this is done run the `go tool trace trace.out `
// to look at the trace in a web browser
