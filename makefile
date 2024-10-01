pep8unix: pep8 asem8 stripCR

pep8: pep8.cpp
	c++ -o pep8 pep8.cpp
	strip pep8
asem8: asem8.cpp
	c++ -o asem8 asem8.cpp
	strip asem8
stripCR: stripCR.cpp
	c++ -o stripCR stripCR.cpp
	strip stripCR
cleanall:
	rm pep8 asem8 stripCR
emcc: pep8.cpp
	emcc pep8.cpp -o target/pep8.html  --bind -s NO_EXIT_RUNTIME=1 -s "EXPORTED_RUNTIME_METHODS=['ccall']" --preload-file pep8os.pepo --preload-file pep8os.pepl --preload-file trap --preload-file pep8os.pep  
