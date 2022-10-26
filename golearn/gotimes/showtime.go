package main

import  (

	"time"
	"fmt"
)

func main() {
	t := time.Now()

	var Year = t.Year
	var Month = t.Month
	var Day = t.Day

	fmt.Printf("This time date example was printed using Year, Month, and Day variables from a time object. %v - %v - %v \n", Year, Month, Day)

	fmt.Println("This time was printed using epoch time - ", t.Format(time.UnixDate))
	fmt.Println("This time was printed using ANSI-C time - ", t.Format(time.ANSIC))
	fmt.Println("This time was printed using RFC33339 time - ", t.Format(time.RFC3339))
	fmt.Println("This time was printed using Kitchen time - ", t.Format(time.Kitchen))


	// Soecial Case of Custom Time. 
	// Must use this stupid date of "Mon Jan 2 15:04:05 MST 2006"
	// Or Custom formatting will fail
	// This is real dumb and prob only affects 1.19 versions. Maybei nGo 2.0 this "easter egg date" (which is what this prob is)  will be removed

	fmt.Println("\n\nThis is a custom formatted time string using easer egg date. Orders switched around ")
	fmt.Println(t.Format("Mon Jan 2 15:04:05 MST 2006"))
		// Switching the order here
	fmt.Println("1 -->  " + t.Format("Jan 2 Mon 15:04:05 2006 MST"))
	fmt.Println("2 -->  " + t.Format("2006 Jan 2 Mon 15:04:05 MST"))
	fmt.Println("3 -->  " + t.Format("Jan 2 2006 Mon 03:04:05 PM MST"))
	fmt.Println("4 -->  " + t.Format("PM 03:04:05 2006 Jan 2 Mon MST"))
	fmt.Println("4 -->  " + t.Format("Monday PM 03:04:05 of the year 2006 Jan 2 MST"))
	fmt.Println("This accounts for the Daylight Savings Time too and stuff. See manual\n\n")


	// Time using specific dates in a Date object
	startDate := time.Date(2018, 07, 04, 12, 07, 00, 00, time.UTC)
	fmt.Println("Time from a Date object ", startDate)
	fmt.Println("Time from a Date object with custom string " , startDate.Format("Monday,\n+--Jan 2\n+---2006 at 15:04:05"))


	// GoLang's equivalent of timedeltas
	fmt.Println("\nExample of usage of Time Deltas to do math")
	then := time.Date(2022, 8, 1, 05, 00, 00, 0, time.UTC)
	now := time.Now()
	delta := now.Sub(then)
	fmt.Println(delta.Hours())
	print(delta.Hours())

	// Just an example of how to use sleep
	first := time.Now()
	fmt.Printf("It is currently %v\n", first.Format("15:04:05"))
	time.Sleep(1000000000)
	time.Sleep(1 * time.Second)
	second := time.Now()
	fmt.Printf("It is now %v\n", second.Format("15:04:05"))

	// Examples of making human readable time deltas
	today := time.Now()
	fmt.Printf("It is currently %v\n", today.Format("Monday, Jan 2 2006"))
	startDate := time.Date(2018, 07, 04, 9, 00, 00, 0, time.UTC)
	elapsed := time.Since(startDate)

	fmt.Printf("Hours: %.0f Minutes: %.0f Seconds: %.0f\n", elapsed.Hours(), elapsed.Minutes(), elapsed.Seconds())
	*/

/*
	// Using the time.Add function
	today := time.Now()
	future := today.Add(6 * time.Hour)
	past := today.AddDate(0, -6, 0)     // 4 Months back

	fmt.Printf("six months ago it was %v\n", past.Format("Monday, January 2"))
	fmt.Printf("Time in six hours will be %v\n", future.Format("Monday, January 2"))
*/

	bedtime := time.Date(2020, 6, 6, 23, 0, 0, 0, time.Local)

	fmt.Printf("There is %.0f hours until bed time\n", time.Until(bedtime).Hours())



}
