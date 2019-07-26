# CE3104 - Scheme Programming Resources
Collection of Scheme language resources of the course (CE3104) Languages, Compilers and Interpreters focused on the functional programming paradigm.

<p align=center><img src="https://upload.wikimedia.org/wikipedia/commons/c/c1/Racket-logo.svg" high=500 width=100></p>

***
# Scheme Language
<p align="left">
  <img
       src="https://camo.githubusercontent.com/a3469255f3fcdead1593919251ab6f438744e9be/68747470733a2f2f63692e6170707665796f722e636f6d2f6170692f70726f6a656374732f7374617475732f346f3338706c743078626f31756263382f6272616e63682f6d61737465723f7376673d74727565">
  
  <img src = "https://img.shields.io/badge/license-GPL-blue">

  <img src="https://camo.githubusercontent.com/bc442b82f9ee7ab250bdee5c6fd1f61ee3965952/68747470733a2f2f6170692e636f646163792e636f6d2f70726f6a6563742f62616467652f47726164652f6431313438336130636335633465626439646134666639663763643536363930">
</p>

## Description
<p align=justify>The <b>programming languages course</b> introduces the four main programming paradigms and its most representative languages. The <b>Scheme</b> language is designed to be modeled using functional programming, that is, through the use of separate functions that together provide the solution to a problem.<br>
Most of this material has been compiled from the book <i>"Introducción a la programación con Scheme"</i> by José Helo Guzmán and the notes of <a href="http://www.dccia.ua.es/dccia/inf/asignaturas/LPP/2007-2008/calendario.html
">"Lenguajes y paradigmas de programación"</a> page.</p> 

<p align=justify>What's in this repository?</p>

* Functions and Expressions.
* Data input/output.
* Conditionals.
* Iterations.
* Recursion and Applied Mathematics.
* List and Arrays.
* Trees and Graphs.


## Getting Started
Prerequisites:You must have [Git](https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git) installed on your console.

1. On GitHub, go to the main page of the [repository](https://github.com/estalvgs1999/CE3104-Scheme.git).
2. Under the name of the repository, click Clone or download.
3. In the Clone with HTTPs section, click to copy the repository cloning URL.
4. Open Git Bash.
5. Change the current working directory to the location where you want the cloned directory to be made.
6. Type 'git clone', and then paste the URL that you copied in Step 2.

   ```$ git clone https://github.com/estalvgs1999/CE3104-Scheme.git```
   
7. Press Enter. Your local clone will be created for [CE3104-Scheme](https://github.com/estalvgs1999/CE3104-Scheme.git).
8. Now you can access the examples contained in this repository; but remember to be aware because I am constantly uploading new material.

### Prerequisites

To run the examples you need a code editor and a Scheme compiler. I recommend DrRacket that you can download from the [official website](https://download.racket-lang.org/) or install from the Ubuntu PPA. For this you must follow these steps:

1. Open your terminal ```Ctrl + Alt + T```.
2. Enter this command to add the Racket PPA:
```
$ sudo add-apt-repository ppa:plt/racket
```
3. Install it with this command:
```
$ sudo apt-get install racket
```


### Usage
<p align=justify>The reason for this project is to have resources and examples of the Scheme functional language, so you can consult them to learn or remember how that thing was done?<br>
For example, the fibonacci series:</p>

```Scheme
;; Fibonacci's Series Scheme implementation

(define (fib num)
   (cond ((or (zero? num) (equal? num 1))
           1 )
         (else (+ (fib (- num 1)) (fib (- num 2))))
   )
)
```

## Authors and acknowledgments

**Esteban Alvarado** - *Computer Engineering Student* - [@estalvgs1999](https://github.com/estalvgs1999)

I thank the teachers of the course:
* **Ing. Marco Rivera Meneses** from Programming Languages
* **Ing. Marco Hernández Vásquez** from Compilers and Interpreters

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](https://github.com/estalvgs1999/CE3104-Scheme/blob/master/LICENSE) file for details


***
<p align="center">
<img src="https://res.cloudinary.com/estalvgs1999/image/upload/v1564118741/CE2103/E_fayxtl.png" width="80"/>
</p>
