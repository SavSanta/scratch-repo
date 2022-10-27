package module2

import (
	"errors"
	"time"
)

// START Initial code

// Budget stores Budget information
type Budget struct {
	Max   float32
	Items []Item
}

// Item stores Item information
type Item struct {
	Description string
	Price       float32
}

var report map[time.Month]*Budget

// InitializeReport creates an empty map
// to store each budget
func InitializeReport() {
	report = make(map[time.Month]*Budget)
}

func init() {
	InitializeReport()
}

// CurrentCost returns how much we've added
// to the current budget
func (b Budget) CurrentCost() float32 {
	var sum float32
	for _, item := range b.Items {
		sum += item.Price
	}
	return sum
}

var errDoesNotFitBudget = errors.New("Item does not fit the budget")

var errReportIsFull = errors.New("Report is full")

var errDuplicateEntry = errors.New("Cannot add duplicate entry")

// END Initial code


// AddItem adds an item to the current budget
func (b *Budget) AddItem(description string, price float32) error {

	if (b.CurrentCost() + price > b.Max) { 

		 return errDoesNotFitBudget
	}

	newItem := Item{Description:description , Price:price}

	// Note this is added to 
	// the pointer representation by explicit use of the b.Items object. 
	// Also have to explicity assigng it so dont worry bout the overwrite it

	b.Items = append(b.Items, newItem)

	return nil
}

// RemoveItem removes a given item from the current budget
func (b *Budget) RemoveItem(description string) {
	for i := range b.Items {
		if b.Items[i].Description == description {

			// Weird way to delete we're basically remaking the slice. First arg is everything up until the matchin point
			// So presumably an eclusive like in python
			// Then everything afterby adding 1 to i when it is the start selector in the second argument
			// also notice setting it to b.Items explicitly
			// "..." ellipsis is the spread operator
			b.Items = append(b.Items[:i], b.Items[i+1:]...)

			// Gotta Break out otherwise we will ge an out-of-range on the next iterations attempt
			break
		}
	}
}

// CreateBudget creates a new budget with a specified max
func CreateBudget(month time.Month, max float32) (*Budget, error) {
	var newBudget *Budget

	// Exit if all months have entries
	if len(report) >= 12 {
		// return nil and error
		// Always wonder why we return nill if this is an error
		return nil, errReportIsFull
	}


	// Dont Understand this syntax but it works
	// I think this weird syntax is like if (initialize variables ; pull out the key-value ; do not increment) syntax
	if _, hasEntry := report[month]; hasEntry {
		return nil, errDuplicateEntry
	}

	// Always better to declare the pointer separately above instead of walrus-ing
	newBudget = &Budget { Max : max }

	report[month] = newBudget

	return newBudget, nil
}

// GetBudget returns budget for given month
func GetBudget(month time.Month) *Budget {

	budget, ok := report[month]
	if ok {
		return budget
	}

	return nil
}

