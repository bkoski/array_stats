package main

import (
	"errors"
	"math"
	"sort"
  "C"
)

func percentile(arr []int, p int) (float64, error) {
	var result float64
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
		result = float64(arr[int(truncated)-1] + arr[int(truncated)]) / 2.0
	}
	return result, nil
}

func main() {}
