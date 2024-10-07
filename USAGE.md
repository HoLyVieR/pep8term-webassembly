# WebAssembly Build of Pep8 Term

This project provides WebAssembly bindings for the pep8term projects. This allows the simulation of compiled Pep/8 program in a web environnment. This was mostly built for purpose of building an automated tester for the Pep/8 assignment provided in university courses.

## Installation

This projects requires EMCC to already be installed. Use the instructions provided here to do so : 
https://emscripten.org/docs/getting_started/downloads.html

## Using for automated testing

Start by building the project

> make emcc

Copy the file `target/pep8-bundle.html` to `path/to/your_file.html`.

Edit the variable `__jeux_validation` in the HTML file. The `in` specifies the STDIN provided to the program and the `out` specifies the STDOUT that we expect the program to produce. When specifying value in the `in`, ensure that values are terminated by a line feed (`\n`).
