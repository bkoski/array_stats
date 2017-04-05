package main

import (
	"C"
	"sort"
)

//export percentile
func percentile(arr []int, p int) float32 {
	var result float32
	sort.Ints(arr)
	rank := (float32(p) / 100.0) * float32(len(arr))
	truncated := float32(int(rank))
	rounded := int(rank + 0.5)
	if (rank - truncated) != 0.0 {
		result = float32(arr[rounded-1])
	} else {
		result = float32(arr[int(truncated)-1]+arr[int(truncated)]) / 2.0
	}
	return result
}

func main() {}
