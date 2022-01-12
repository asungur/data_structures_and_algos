package main

import (
	"fmt"
)

func romanToInt(s string) (total int) {
	lookup := map[byte]int{'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
	total = lookup[s[len(s)-1]]

	for i := len(s) - 2; i >= 0; i-- {
		if lookup[s[i]] < lookup[s[i+1]] {
			total -= lookup[s[i]]
		} else {
			total += lookup[s[i]]
		}
	}
	return
}

func main() {
	fmt.Println(romanToInt("III"))
	fmt.Println(romanToInt("LVIII"))
	fmt.Println(romanToInt("MCMXCIV"))
}
