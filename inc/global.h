#ifndef __VVC_GLOBAL_H
#define __VVC_GLOBAL_H

#include <stdint.h>
#include "stm32f7xx.h"

// Define GPIOB pin mappings for our LED and button.
#define LED_PIN    (7)
#define USR_BTN    (13)

volatile uint32_t core_clock_hz;

#endif //ifndef __VVC_GLOBAL_H
