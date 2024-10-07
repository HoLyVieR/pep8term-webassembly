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
	base64 -w0 target/pep8.data > target/pep8.data.b64
	base64 -w0 target/pep8.wasm > target/pep8.wasm.b64
	python3 -c "open('target/pep8-bundle.html', 'w').write(open('template.html').read().replace('{PEP8_WASM_BLOB}', open('target/pep8.wasm.b64').read()).replace('{PEP8_DATA_BLOB}', open('target/pep8.data.b64').read()))"
