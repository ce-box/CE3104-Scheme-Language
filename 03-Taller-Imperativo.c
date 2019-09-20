#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1000

int digitos_aux(int num, int digitos);
int pares_aux(int num, int digitos);
void eliminar_todos(char *str, const char *toRemove);

//1. Funcion que imprime millas en un rango 1/10
void km_a_millas()
{
    // 1 km = 0.621 millas
    for (int km = 1; km <= 10; km++)
    {
        float millas = km * (0.621);
        printf("* %d km - %.3f millas\n", km, millas);
    }
}

//2. Funcion que imprime el equivalente de C en F
void celsius_a_farenheit(int celsius)
{
    //  F = (°C × 9/5) + 32
    float farenheit = ((celsius * 9) / 5) + 32;
    printf("* %d °C - %.2f °F\n", celsius, farenheit);
}

//3. Escriba una funcion recursiva para calcular la cantidad
//   de digitos de un numero.

int cantidad_digitos(int num)
{
    return digitos_aux(num, 0);
}

int digitos_aux(int num, int digitos)
{
    if (num == 0)
    {
        return digitos;
    }
    int n = num / 10;
    digitos++;
    digitos_aux(n, digitos);
}

// 4. Escriba una funcion recursiva que calcule la cantidad
//    de digitos pares de un numero

int cantidad_pares(int num)
{
    return pares_aux(num, 0);
}

int pares_aux(int num, int digitos)
{
    if (num == 0)
    {
        return digitos;
    }
    else if ((num % 10) % 2 == 0)
    {
        digitos++;
    }
    int n = num / 10;
    pares_aux(n, digitos);
}

// 5. Escriba la funcion strcmp(char *s, char *p)
int strcomp(char *s, char *p)
{
    int res;
    while (*s != '\0' && *p != '\0')
    {
        if (*(s + 1) == '\0' && *(p + 1) == '\0')
            res = 0;
        else if (*(p + 1) == '\0')
            res = 1;
        else if (*(s + 1) == '\0')
            res = -1;
        s++;
        p++;
    }
    return res;
}

// 6. Escriba la siguiente función:
//      void strcat(char *dest, char *src)
// La función pega al final del string dest el valor del string src..
char *strconcat(char *dest, char *src)
{
    int i = 0, j = 0;
    char *res = (char *)malloc(sizeof(dest) + sizeof(src) + 1);
    while (dest[i] != '\0')
    {
        res[i] = dest[i];
        i++;
    }
    while (src[j] != '\0')
    {
        res[i] = src[j];
        i++;
        j++;
    }
    res[i] = '\0';
    return res;
}

// 7. Escriba un programa que imprima una lista de todas las palabras de un documento,
// y para cada palabra una lista de los números de línea en los que aparece.
// Elimine palabras como el, la, los, y, etc.

int eliminar_palabras(char *palabra)
{
    FILE *fPtr;
    FILE *fTemp;
    char path[100] = "text.txt";

    char buffer[1000];

    // Abre los archivos
    fPtr = fopen(path, "r");
    fTemp = fopen("delete.tmp", "w");

    // fopen() retorna NULL si no logra abrir el archivo
    if (fPtr == NULL || fTemp == NULL)
    {
        // No es posible abrir el archivo
        printf("\nNO ES POSIBLE ABRIR EL ARCHIVO.\n");
        exit(EXIT_SUCCESS);
    }

    /*
     * Lee una línea y elimina la palabra determinada
     */
    while ((fgets(buffer, BUFFER_SIZE, fPtr)) != NULL)
    {
        // Remove all occurrence of word from current line
        eliminar_todos(buffer, palabra);

        // Write to temp file
        fputs(buffer, fTemp);
    }

    /* Close all files to release resource */
    fclose(fPtr);
    fclose(fTemp);

    /* Delete original source file */
    remove(path);

    // Renombra el archivo temporal como el original
    rename("delete.tmp", path);

    printf("\nAll occurrence of '%s' removed successfully.", palabra);

    return 0;
}

/**
 Elimina todas las apariciones de una palabra en una cadena de chars
 */
void eliminar_todos(char *str, const char *toRemove)
{
    int i, j, stringLen, toRemoveLen;
    int found;

    stringLen = strlen(str);        // Length of string
    toRemoveLen = strlen(toRemove); // Length of word to remove

    for (i = 0; i <= stringLen - toRemoveLen; i++)
    {
        // Hay match con la palabra
        found = 1;
        for (j = 0; j < toRemoveLen; j++)
        {
            if (str[i + j] != toRemove[j])
            {
                found = 0;
                break;
            }
        }

        // Si no es una palabra
        if (str[i + j] != ' ' && str[i + j] != '\t' && str[i + j] != '\n' && str[i + j] != '\0')
        {
            found = 0;
        }

        if (found == 1)
        {
            for (j = i; j <= stringLen - toRemoveLen; j++)
            {
                str[j] = str[j + toRemoveLen];
            }

            stringLen = stringLen - toRemoveLen;

            i--;
        }
    }
}

// 8. Escriba un programa que imprima las distintas palabras de su entrada,
// ordenadas en forma descendente de acuerdo con su frecuencia de ocurrencia.
// Precede a cada palabra por su conteo.

// Corridas a los ejercicios para probar
int main(int argc, char const *argv[])
{
    // Ejercicio #1
    printf("----------------------\n    Km -> Millas\n----------------------\n");
    km_a_millas();

    // Ejercicio #2
    printf("----------------------\n    Celsius a Farenheit\n----------------------\n");
    celsius_a_farenheit(32);

    // Ejercicio #3
    printf("----------------------\n    Cantidad Digitos\n----------------------\n");
    int cant = cantidad_digitos(1234);
    printf("Cantidad de digitos de 1234: %d \n", cant);

    // Ejercicio #4
    printf("----------------------\n    Cantidad Pares\n----------------------\n");
    int cantp1 = cantidad_pares(12345); // pares: 2
    int cantp2 = cantidad_pares(135);   // pares: 0
    printf("Cantidad pares 1: %d \nCantidad pares 2: %d\n", cantp1, cantp2);

    // Ejercicio #5

    int caso1 = strcomp("12345", "1234");
    int caso2 = strcomp("1234", "1234");
    int caso3 = strcomp("123", "1234");

    printf("----------------------\n");
    printf("strcomp\n caso1: %d\n caso2: %d\n caso3: %d\n", caso1, caso2, caso3);

    // Ejercicio #6
    char str1[] = "campa";
    char str2[] = "mento";

    printf("----------------------\n");
    printf("strconcat\n El resultado de unir %s y %s es: %s\n", str1, str2, strconcat(str1, str2));

    // Ejercicio #7
    // Eliminar palabras
    eliminar_palabras("es");
    return 0;
}
