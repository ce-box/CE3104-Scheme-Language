#include<stdio.h>

int digitos_aux(int num, int digitos);
int pares_aux(int num, int digitos);

//1. Funcion que imprime millas en un rango 1/10
void km_a_millas(){
    // 1 km = 0.621 millas
    for(int km = 1; km <= 10; km++){
        float millas = km*(0.621);
        printf("* %d km - %.3f millas\n",km,millas);
    }
}

//2. Funcion que imprime el equivalente de C en F
void celsius_a_farenheit(int celsius){
    //  F = (°C × 9/5) + 32
    float farenheit = ((celsius*9)/5) + 32; 
    printf("* %d °C - %.2f °F\n",celsius,farenheit);
}

//3. Escriba una funcion recursiva para calcular la cantidad 
//   de digitos de un numero.

int cantidad_digitos(int num){
    return digitos_aux(num,0);
}

int digitos_aux(int num, int digitos){
    if(num == 0){
        return digitos;
    }
    int n = num/10;
    digitos++;
    digitos_aux(n,digitos);
}

// 4. Escriba una funcion recursiva que calcule la cantidad 
//    de digitos pares de un numero

int cantidad_pares(int num){
    return pares_aux(num,0);
}

int pares_aux(int num, int digitos){
    if(num == 0){
        return digitos;
    }else 
    if((num%10)%2 == 0){
        digitos++;
    }
    int n = num/10;
    pares_aux(n,digitos);
}

// 5. Escriba la funcion strcmp(char *s, char *p)

// 6. Escriba la siguiente función:
//      void strcat(char *dest, char *src)
// La función pega al final del string dest el valor del string src..

// 7. Escriba un programa que imprima una lista de todas las palabras de un documento, 
// y para cada palabra una lista de los números de línea en los que aparece.
// Elimine palabras como el, la, los, y, etc.

// 8. Escriba un programa que imprima las distintas palabras de su entrada, 
// ordenadas en forma descendente de acuerdo con su frecuencia de ocurrencia. 
// Precede a cada palabra por su conteo.


// Corridas a los ejercicios para probar
int main(int argc, char const *argv[])
{
    km_a_millas();
    celsius_a_farenheit(32);
    int cant = cantidad_digitos(1234);
    printf("Cantidad de digitos de 1234: %d \n", cant);
    int cantp1 = cantidad_pares(12345); // pares: 2
    int cantp2 = cantidad_pares(135); // pares: 0
    printf("Cantidad pares 1: %d \nCantidad pares 2: %d\n", cantp1, cantp2);
    return 0;
}