#include <Microbit.h>

MicroBit uBit;

int main()
{
    uBit.init();
    
    while(1)
    {
        uBit.display.print("Hello World!");
    }
}
