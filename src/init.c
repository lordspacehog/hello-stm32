#include "init.h"

void SystemInit(void) {
	/************
	 * RCC Setup
	 ************/
	// enable NVIC
	RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
	// enable GPIO Port B
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN;
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOCEN;

	/********
	 * External Interrupt Config
	 ********/
	// Enable EXTI on Port C
	SYSCFG->EXTICR[3] &= ~(SYSCFG_EXTICR4_EXTI13_Msk);
	SYSCFG->EXTICR[3] |=  (SYSCFG_EXTICR4_EXTI13_PC);
	// Setup Interrupt to button pin
	EXTI->IMR |= (1 << USR_BTN);
	EXTI->RTSR &= ~(1 << USR_BTN);
	EXTI->FTSR |= (1 << USR_BTN);
	// Enable NVIC for EXTI0_0
	NVIC_SetPriority(EXTI15_10_IRQn, 0x03);
	NVIC_EnableIRQ(EXTI15_10_IRQn);

	/*******
	 * GPIO Pin Setup
	 *******/
	// Setup LED pin as output
	GPIOB->MODER  &= ~(0x3 << (LED_PIN*2));
	GPIOB->MODER  |=  (0x1 << (LED_PIN*2));
	GPIOB->OTYPER &= ~(1 << LED_PIN);

	// Initialize Clock
	ClockInit();
}

void ClockInit(void) {
	// Configure the PLL to ((HSI / 10) * 60) / 2 = 48MHz. HSI = 16MHz
	RCC->CFGR  =  ((RCC_PLLCFGR_PLLSRC_HSI)|
                   (0x08UL << RCC_PLLCFGR_PLLM_Pos)|
                   (0x60UL << RCC_PLLCFGR_PLLN_Pos)|
                   (0x02UL << RCC_PLLCFGR_PLLP_Pos));
	// Turn the PLL on and wait for it to be ready.
	RCC->CR    |=  (RCC_CR_PLLON);
	while (!(RCC->CR & RCC_CR_PLLRDY)) {};
	// Select the PLL as the system clock source.
	RCC->CFGR  =  (RCC_CFGR_SWS_PLL|RCC_CFGR_SW_PLL);
	while (!(RCC->CFGR & RCC_CFGR_SWS_PLL)) {};
	// Set the global clock speed variable.
	core_clock_hz = 48000000;
}
