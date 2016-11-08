require "mkmf"

find_executable('go')

%x{go build -buildmode=c-shared -o libgostats.so main.go}
create_makefile("array_stats/array_stats")
