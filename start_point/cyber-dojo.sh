set -e

[ -e report/coverage.txt ] && rm report/coverage.txt
mkdir -p report
make
gcovr --gcov-executable 'llvm-cov gcov' --root . > report/coverage.txt
