#include "nvic.h"

void EXTI15_10_IRQ_handler(void) {
    if (EXTI->PR & (1 << USR_BTN)) {
        // Clear the EXTI status flag.
        EXTI->PR |= (1 << USR_BTN);
        // Toggle the global 'led on?' variable.
        GPIOB->ODR ^= (1 << LED_PIN);
    }
}
