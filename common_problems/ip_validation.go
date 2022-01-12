package main

import (
	"fmt"
	"strconv"
	"strings"
)

// O(N)
// SPEED TOP, MEMO TOP %70
func isValidIPv4(queryIP string) bool {
	bits := strings.Split(queryIP, ".")
	if len(bits) != 4 {
		return false
	}
	for _, bit := range bits {
		num, _ := strconv.Atoi(bit)
		if num < 0 || num > 255 || len(bit) != len(strconv.Itoa(num)) {
			return false
		}
	}
	return true
}

func isValidIPv6(queryIP string) bool {
	hexes := strings.Split(queryIP, ":")
	hexDigits := "0123456789abcdefABCDEF"
	if len(hexes) != 8 {
		return false
	}
	for _, hexStr := range hexes {
		if len(hexStr) == 0 || len(hexStr) > 4 {
			return false
		}
		for _, char := range hexStr {
			if !strings.Contains(hexDigits, string(char)) {
				return false
			}
		}
	}
	return true
}

func validIpAddress(queryIP string) string {
	if isValidIPv4(queryIP) {
		return "IPv4"
	}
	if isValidIPv6(queryIP) {
		return "IPv6"
	}
	return "Neither"
}

func main() {
	fmt.Println(validIpAddress("172.16.254.1"))
	// fmt.Println(validIpAddress("172.16.254.001"))
	// fmt.Println(validIpAddress("172.16.254.1"))
	// fmt.Println(validIpAddress("256.256.256.256"))
	// fmt.Println(validIpAddress("2001:0db8:85a3:0:0:8A2E:0370:7334"))
}
