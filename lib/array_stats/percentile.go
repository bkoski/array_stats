package main

import (
	"errors"
	"fmt"
	"math"
	"sort"
	"strconv"
	"strings"
)

func percentile(str string, p int) (float64, error) {
	var result float64
	arr := string_to_int_arr(str)
	sort.Ints(arr)
	rank := (float64(p) / 100.0) * float64(len(arr))
	truncated := math.Trunc(rank)
	rounded := int(rank + 0.5)
	if len(arr) == 0 || p > 99 {
		err := errors.New("incorrect conditions")
		return 0.0, err
	}
	if (rank - truncated) != 0.0 {
		result = float64(arr[rounded-1])
	} else {
		result = float64(arr[int(truncated)-1]+arr[int(truncated)]) / 2.0
	}
	return result, nil
}

func string_to_int_arr(str string) []int {
	var int_arr []int
	str_arr := strings.Split(str, ",")
	for _, i := range str_arr {
		j, err := strconv.Atoi(i)
		if err != nil {
			panic(err)
		}
		int_arr = append(int_arr, j)
	}
	return int_arr
}

func main() {
	arr := "43,54,56,61,62,66,68,69,69,70,71,72,77,78,79,85,87,88,89,93,95,96,98,99,99"
	answer, err := percentile(arr, 48)
	if err != nil {
		fmt.Println("Shit!!!")
	}
	fmt.Println(answer)
}
