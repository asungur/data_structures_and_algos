package main

import (
	"fmt"
	"regexp"
	"strings"
)

var isAlphaNumeric = regexp.MustCompile("^[a-zA-Z0-9]+$").MatchString

func isPalindrome(s string) bool {
	i, j := 0, (len(s) - 1)
	for i < j {
		for i < j && !isAlphaNumeric(string(s[i])) {
			i++
		}
		for i < j && !isAlphaNumeric(string(s[j])) {
			j--
		}
		if strings.ToLower(string(s[i])) != strings.ToLower(string(s[j])) {
			return false
		}
		i++
		j--
	}
	return true
}

func main() {
	fmt.Println(isPalindrome("A man, a plan, a canal: Panama"))
	fmt.Println(isPalindrome("race a car"))
}
