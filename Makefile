#Detect WIN or UNIX system
ifeq ($(OS), Windows_NT)
	OS=WINDOWS
else
	OS=UNIX
endif

prepare:
# Prepare on windows
ifeq ($(OS),WINDOWS)
	if exist build ( rmdir /s/q build )
	mkdir build
	cd build
endif

# Prepare on unix
ifeq ($(OS),UNIX)
	rm -rf build
	mkdir build
	cd build
endif

deps:
	cd build && cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o graphImage.png

conan_d:
	rmdir /s/q build
	mkdir build
	cd build && conan install .. -s build_type=Debug --output-folder=. --build missing -s compiler.cppstd=17

conan_r:
	rmdir /s/q build
	mkdir build
	cd build && conan install .. -s build_type=Release --output-folder=. --build missing -s compiler.cppstd=17
