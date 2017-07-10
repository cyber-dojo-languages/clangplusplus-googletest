CXX_STD=c++1z
#CXX_STD=c++14

CXXFLAGS += -I. -std=$(CXX_STD) -Wall -Wextra -Werror

# currently ubuntu17.04 + clang++4.0 gives spurious
# Leak warnings when sanitizers are enabled with c++17

ifeq ($(CXX_STD),c++14)
  CXXFLAGS += -fsanitize=undefined -fno-sanitize-recover=undefined
  CXXFLAGS += -fsanitize=address -fno-omit-frame-pointer
endif

GTEST_LIBS = -lgtest -lgtest_main -pthread

HPP_FILES = $(wildcard *.hpp)
COMPILED_HPP_FILES = $(patsubst %.hpp,%.compiled_hpp,$(HPP_FILES))
CPP_FILES = $(wildcard *.cpp)

.PHONY: test.output
test.output: test makefile
	@./$< --gtest_shuffle

test: makefile $(CPP_FILES) $(COMPILED_HPP_FILES)
	@$(CXX) $(CXXFLAGS) -O $(CPP_FILES) $(GTEST_LIBS) -o $@

# This rule ensures header files build in their own right.
# The quality of header files is important because header files
# are #included from other files and thus have a large span
# of influence (unlike .cpp files which are not #included)

%.compiled_hpp: %.hpp
	@$(CXX) -x c++ $(CXXFLAGS) -c -o $@ $<
