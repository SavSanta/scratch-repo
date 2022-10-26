package main

import (
	"encoding/json"
	"net/http"
	"log"
)


func main() {


	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

		// Get The names into a query param
		names := r.URL.Query()["name"]
		var name string

		// Check if multiple names have been passed and if so grab only the first one
		if len(names) == 1 {
			name = names[0]
		}

		// Send back one line
		//w.Write([]byte("Hello Sexy Baby, " + name + " .\n You Used a Writer to Write This"))

		// Send Back Output as a JSON Response
		m := map[string]string{"name": name}
		enc := json.NewEncoder(w)
		enc.Encode(m)


	})

	err := http.ListenAndServe(":4001", nil)
	if err != nil {
		log.Fatal(err)
	}


}
