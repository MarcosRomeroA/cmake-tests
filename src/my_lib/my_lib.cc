#include "my_lib.h"
#include <iostream>

/**
 * @brief Print hello world to test the json library
 *
 */
void print_hello_world(){
    std::cout << "Hello World!\n";
}

std::uint32_t factorial(std::uint32_t number)
{
    return number <= 1 ? number : factorial (number - 1) * number;
}
