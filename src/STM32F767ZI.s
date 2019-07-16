.syntax unified
.cpu cortex-m7
.fpu fpv5-d16
.thumb

.global vtable
.global default_interrupt_handler

/* start address for the initialization values of the .data section.
defined in linker script */
.word _sidata
/* start address for the .data section. defined in linker script */
.word _sdata
/* end address for the .data section. defined in linker script */
.word _edata
/* start address for the .bss section. defined in linker script */
.word _sbss
/* end address for the .bss section. defined in linker script */
.word _ebss

.section .isr_vector,"a",%progbits
.type vtable, %object
.size  vtable, .-vtable
vtable:
  .word  _estack
  .word  reset_handler

  .word  NMI_handler
  .word  hardfault_handler
  .word  memmanage_handler
  .word  busfault_handler
  .word  usagefault_handler
  .word  0
  .word  0
  .word  0
  .word  0
  .word  SVC_handler
  .word  debugmon_handler
  .word  0
  .word  pending_SV_handler
  .word  SysTick_handler

  /* External Interrupts */
  .word     WWDG_IRQ_handler                   /* Window WatchDog              */
  .word     PVD_IRQ_handler                    /* PVD through EXTI Line detection */
  .word     TAMP_STAMP_IRQ_handler             /* Tamper and TimeStamps through the EXTI line */
  .word     RTC_WKUP_IRQ_handler               /* RTC Wakeup through the EXTI line */
  .word     FLASH_IRQ_handler                  /* FLASH                        */
  .word     RCC_IRQ_handler                    /* RCC                          */
  .word     EXTI0_IRQ_handler                  /* EXTI Line0                   */
  .word     EXTI1_IRQ_handler                  /* EXTI Line1                   */
  .word     EXTI2_IRQ_handler                  /* EXTI Line2                   */
  .word     EXTI3_IRQ_handler                  /* EXTI Line3                   */
  .word     EXTI4_IRQ_handler                  /* EXTI Line4                   */
  .word     DMA1_Stream0_IRQ_handler           /* DMA1 Stream 0                */
  .word     DMA1_Stream1_IRQ_handler           /* DMA1 Stream 1                */
  .word     DMA1_Stream2_IRQ_handler           /* DMA1 Stream 2                */
  .word     DMA1_Stream3_IRQ_handler           /* DMA1 Stream 3                */
  .word     DMA1_Stream4_IRQ_handler           /* DMA1 Stream 4                */
  .word     DMA1_Stream5_IRQ_handler           /* DMA1 Stream 5                */
  .word     DMA1_Stream6_IRQ_handler           /* DMA1 Stream 6                */
  .word     ADC_IRQ_handler                    /* ADC1, ADC2 and ADC3s         */
  .word     CAN1_TX_IRQ_handler                /* CAN1 TX                      */
  .word     CAN1_RX0_IRQ_handler               /* CAN1 RX0                     */
  .word     CAN1_RX1_IRQ_handler               /* CAN1 RX1                     */
  .word     CAN1_SCE_IRQ_handler               /* CAN1 SCE                     */
  .word     EXTI9_5_IRQ_handler                /* External Line[9:5]s          */
  .word     TIM1_BRK_TIM9_IRQ_handler          /* TIM1 Break and TIM9          */
  .word     TIM1_UP_TIM10_IRQ_handler          /* TIM1 Update and TIM10        */
  .word     TIM1_TRG_COM_TIM11_IRQ_handler     /* TIM1 Trigger and Commutation and TIM11 */
  .word     TIM1_CC_IRQ_handler                /* TIM1 Capture Compare         */
  .word     TIM2_IRQ_handler                   /* TIM2                         */
  .word     TIM3_IRQ_handler                   /* TIM3                         */
  .word     TIM4_IRQ_handler                   /* TIM4                         */
  .word     I2C1_EV_IRQ_handler                /* I2C1 Event                   */
  .word     I2C1_ER_IRQ_handler                /* I2C1 Error                   */
  .word     I2C2_EV_IRQ_handler                /* I2C2 Event                   */
  .word     I2C2_ER_IRQ_handler                /* I2C2 Error                   */
  .word     SPI1_IRQ_handler                   /* SPI1                         */
  .word     SPI2_IRQ_handler                   /* SPI2                         */
  .word     USART1_IRQ_handler                 /* USART1                       */
  .word     USART2_IRQ_handler                 /* USART2                       */
  .word     USART3_IRQ_handler                 /* USART3                       */
  .word     EXTI15_10_IRQ_handler              /* External Line[15:10]s        */
  .word     RTC_Alarm_IRQ_handler              /* RTC Alarm (A and B) through EXTI Line */
  .word     OTG_FS_WKUP_IRQ_handler            /* USB OTG FS Wakeup through EXTI line */
  .word     TIM8_BRK_TIM12_IRQ_handler         /* TIM8 Break and TIM12         */
  .word     TIM8_UP_TIM13_IRQ_handler          /* TIM8 Update and TIM13        */
  .word     TIM8_TRG_COM_TIM14_IRQ_handler     /* TIM8 Trigger and Commutation and TIM14 */
  .word     TIM8_CC_IRQ_handler                /* TIM8 Capture Compare         */
  .word     DMA1_Stream7_IRQ_handler           /* DMA1 Stream7                 */
  .word     FMC_IRQ_handler                    /* FMC                          */
  .word     SDMMC1_IRQ_handler                 /* SDMMC1                       */
  .word     TIM5_IRQ_handler                   /* TIM5                         */
  .word     SPI3_IRQ_handler                   /* SPI3                         */
  .word     UART4_IRQ_handler                  /* UART4                        */
  .word     UART5_IRQ_handler                  /* UART5                        */
  .word     TIM6_DAC_IRQ_handler               /* TIM6 and DAC1&2 underrun errors */
  .word     TIM7_IRQ_handler                   /* TIM7                         */
  .word     DMA2_Stream0_IRQ_handler           /* DMA2 Stream 0                */
  .word     DMA2_Stream1_IRQ_handler           /* DMA2 Stream 1                */
  .word     DMA2_Stream2_IRQ_handler           /* DMA2 Stream 2                */
  .word     DMA2_Stream3_IRQ_handler           /* DMA2 Stream 3                */
  .word     DMA2_Stream4_IRQ_handler           /* DMA2 Stream 4                */
  .word     ETH_IRQ_handler                    /* Ethernet                     */
  .word     ETH_WKUP_IRQ_handler               /* Ethernet Wakeup through EXTI line */
  .word     CAN2_TX_IRQ_handler                /* CAN2 TX                      */
  .word     CAN2_RX0_IRQ_handler               /* CAN2 RX0                     */
  .word     CAN2_RX1_IRQ_handler               /* CAN2 RX1                     */
  .word     CAN2_SCE_IRQ_handler               /* CAN2 SCE                     */
  .word     OTG_FS_IRQ_handler                 /* USB OTG FS                   */
  .word     DMA2_Stream5_IRQ_handler           /* DMA2 Stream 5                */
  .word     DMA2_Stream6_IRQ_handler           /* DMA2 Stream 6                */
  .word     DMA2_Stream7_IRQ_handler           /* DMA2 Stream 7                */
  .word     USART6_IRQ_handler                 /* USART6                       */
  .word     I2C3_EV_IRQ_handler                /* I2C3 event                   */
  .word     I2C3_ER_IRQ_handler                /* I2C3 error                   */
  .word     OTG_HS_EP1_OUT_IRQ_handler         /* USB OTG HS End Point 1 Out   */
  .word     OTG_HS_EP1_IN_IRQ_handler          /* USB OTG HS End Point 1 In    */
  .word     OTG_HS_WKUP_IRQ_handler            /* USB OTG HS Wakeup through EXTI */
  .word     OTG_HS_IRQ_handler                 /* USB OTG HS                   */
  .word     DCMI_IRQ_handler                   /* DCMI                         */
  .word     0                                 /* Reserved                     */
  .word     RNG_IRQ_handler                    /* RNG                          */
  .word     FPU_IRQ_handler                    /* FPU                          */
  .word     UART7_IRQ_handler                  /* UART7                        */
  .word     UART8_IRQ_handler                  /* UART8                        */
  .word     SPI4_IRQ_handler                   /* SPI4                         */
  .word     SPI5_IRQ_handler                   /* SPI5                         */
  .word     SPI6_IRQ_handler                   /* SPI6                         */
  .word     SAI1_IRQ_handler                   /* SAI1                         */
  .word     LTDC_IRQ_handler                   /* LTDC                         */
  .word     LTDC_ER_IRQ_handler                /* LTDC error                   */
  .word     DMA2D_IRQ_handler                  /* DMA2D                        */
  .word     SAI2_IRQ_handler                   /* SAI2                         */
  .word     QUADSPI_IRQ_handler                /* QUADSPI                      */
  .word     LPTIM1_IRQ_handler                 /* LPTIM1                       */
  .word     CEC_IRQ_handler                    /* HDMI_CEC                     */
  .word     I2C4_EV_IRQ_handler                /* I2C4 Event                   */
  .word     I2C4_ER_IRQ_handler                /* I2C4 Error                   */
  .word     SPDIF_RX_IRQ_handler               /* SPDIF_RX                     */
  .word     0                                 /* Reserved                     */
  .word     DFSDM1_FLT0_IRQ_handler            /* DFSDM1 Filter 0 global Interrupt */
  .word     DFSDM1_FLT1_IRQ_handler            /* DFSDM1 Filter 1 global Interrupt */
  .word     DFSDM1_FLT2_IRQ_handler            /* DFSDM1 Filter 2 global Interrupt */
  .word     DFSDM1_FLT3_IRQ_handler            /* DFSDM1 Filter 3 global Interrupt */
  .word     SDMMC2_IRQ_handler                 /* SDMMC2                       */
  .word     CAN3_TX_IRQ_handler                /* CAN3 TX                      */
  .word     CAN3_RX0_IRQ_handler               /* CAN3 RX0                     */
  .word     CAN3_RX1_IRQ_handler               /* CAN3 RX1                     */
  .word     CAN3_SCE_IRQ_handler               /* CAN3 SCE                     */
  .word     JPEG_IRQ_handler                   /* JPEG                         */
  .word     MDIOS_IRQ_handler                  /* MDIOS                        */

/*******************************************************************************
*
* Provide weak aliases for each Exception handler to the default_interrupt_handler.
* As they are weak aliases, any function with the same name will override
* this definition.
*
*******************************************************************************/
   .weak      NMI_handler
   .thumb_set NMI_handler,default_interrupt_handler

   .weak      hardfault_handler
   .thumb_set hardfault_handler,default_interrupt_handler

   .weak      memmanage_handler
   .thumb_set memManage_handler,default_interrupt_handler

   .weak      busfault_handler
   .thumb_set BusFault_handler,default_interrupt_handler

   .weak      usagefault_handler
   .thumb_set UsageFault_handler,default_interrupt_handler

   .weak      SVC_handler
   .thumb_set SVC_handler,default_interrupt_handler

   .weak      debugmon_handler
   .thumb_set DebugMon_handler,default_interrupt_handler

   .weak      pending_SV_handler
   .thumb_set pending_SV_handler,default_interrupt_handler

   .weak      SysTick_handler
   .thumb_set SysTick_handler,default_interrupt_handler

   .weak      WWDG_IRQ_handler
   .thumb_set WWDG_IRQ_handler,default_interrupt_handler

   .weak      PVD_IRQ_handler
   .thumb_set PVD_IRQ_handler,default_interrupt_handler

   .weak      TAMP_STAMP_IRQ_handler
   .thumb_set TAMP_STAMP_IRQ_handler,default_interrupt_handler

   .weak      RTC_WKUP_IRQ_handler
   .thumb_set RTC_WKUP_IRQ_handler,default_interrupt_handler

   .weak      FLASH_IRQ_handler
   .thumb_set FLASH_IRQ_handler,default_interrupt_handler

   .weak      RCC_IRQ_handler
   .thumb_set RCC_IRQ_handler,default_interrupt_handler

   .weak      EXTI0_IRQ_handler
   .thumb_set EXTI0_IRQ_handler,default_interrupt_handler

   .weak      EXTI1_IRQ_handler
   .thumb_set EXTI1_IRQ_handler,default_interrupt_handler

   .weak      EXTI2_IRQ_handler
   .thumb_set EXTI2_IRQ_handler,default_interrupt_handler

   .weak      EXTI3_IRQ_handler
   .thumb_set EXTI3_IRQ_handler,default_interrupt_handler

   .weak      EXTI4_IRQ_handler
   .thumb_set EXTI4_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream0_IRQ_handler
   .thumb_set DMA1_Stream0_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream1_IRQ_handler
   .thumb_set DMA1_Stream1_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream2_IRQ_handler
   .thumb_set DMA1_Stream2_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream3_IRQ_handler
   .thumb_set DMA1_Stream3_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream4_IRQ_handler
   .thumb_set DMA1_Stream4_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream5_IRQ_handler
   .thumb_set DMA1_Stream5_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream6_IRQ_handler
   .thumb_set DMA1_Stream6_IRQ_handler,default_interrupt_handler

   .weak      ADC_IRQ_handler
   .thumb_set ADC_IRQ_handler,default_interrupt_handler

   .weak      CAN1_TX_IRQ_handler
   .thumb_set CAN1_TX_IRQ_handler,default_interrupt_handler

   .weak      CAN1_RX0_IRQ_handler
   .thumb_set CAN1_RX0_IRQ_handler,default_interrupt_handler

   .weak      CAN1_RX1_IRQ_handler
   .thumb_set CAN1_RX1_IRQ_handler,default_interrupt_handler

   .weak      CAN1_SCE_IRQ_handler
   .thumb_set CAN1_SCE_IRQ_handler,default_interrupt_handler

   .weak      EXTI9_5_IRQ_handler
   .thumb_set EXTI9_5_IRQ_handler,default_interrupt_handler

   .weak      TIM1_BRK_TIM9_IRQ_handler
   .thumb_set TIM1_BRK_TIM9_IRQ_handler,default_interrupt_handler

   .weak      TIM1_UP_TIM10_IRQ_handler
   .thumb_set TIM1_UP_TIM10_IRQ_handler,default_interrupt_handler

   .weak      TIM1_TRG_COM_TIM11_IRQ_handler
   .thumb_set TIM1_TRG_COM_TIM11_IRQ_handler,default_interrupt_handler

   .weak      TIM1_CC_IRQ_handler
   .thumb_set TIM1_CC_IRQ_handler,default_interrupt_handler

   .weak      TIM2_IRQ_handler
   .thumb_set TIM2_IRQ_handler,default_interrupt_handler

   .weak      TIM3_IRQ_handler
   .thumb_set TIM3_IRQ_handler,default_interrupt_handler

   .weak      TIM4_IRQ_handler
   .thumb_set TIM4_IRQ_handler,default_interrupt_handler

   .weak      I2C1_EV_IRQ_handler
   .thumb_set I2C1_EV_IRQ_handler,default_interrupt_handler

   .weak      I2C1_ER_IRQ_handler
   .thumb_set I2C1_ER_IRQ_handler,default_interrupt_handler

   .weak      I2C2_EV_IRQ_handler
   .thumb_set I2C2_EV_IRQ_handler,default_interrupt_handler

   .weak      I2C2_ER_IRQ_handler
   .thumb_set I2C2_ER_IRQ_handler,default_interrupt_handler

   .weak      SPI1_IRQ_handler
   .thumb_set SPI1_IRQ_handler,default_interrupt_handler

   .weak      SPI2_IRQ_handler
   .thumb_set SPI2_IRQ_handler,default_interrupt_handler

   .weak      USART1_IRQ_handler
   .thumb_set USART1_IRQ_handler,default_interrupt_handler

   .weak      USART2_IRQ_handler
   .thumb_set USART2_IRQ_handler,default_interrupt_handler

   .weak      USART3_IRQ_handler
   .thumb_set USART3_IRQ_handler,default_interrupt_handler

   .weak      EXTI15_10_IRQ_handler
   .thumb_set EXTI15_10_IRQ_handler,default_interrupt_handler

   .weak      RTC_Alarm_IRQ_handler
   .thumb_set RTC_Alarm_IRQ_handler,default_interrupt_handler

   .weak      OTG_FS_WKUP_IRQ_handler
   .thumb_set OTG_FS_WKUP_IRQ_handler,default_interrupt_handler

   .weak      TIM8_BRK_TIM12_IRQ_handler
   .thumb_set TIM8_BRK_TIM12_IRQ_handler,default_interrupt_handler

   .weak      TIM8_UP_TIM13_IRQ_handler
   .thumb_set TIM8_UP_TIM13_IRQ_handler,default_interrupt_handler

   .weak      TIM8_TRG_COM_TIM14_IRQ_handler
   .thumb_set TIM8_TRG_COM_TIM14_IRQ_handler,default_interrupt_handler

   .weak      TIM8_CC_IRQ_handler
   .thumb_set TIM8_CC_IRQ_handler,default_interrupt_handler

   .weak      DMA1_Stream7_IRQ_handler
   .thumb_set DMA1_Stream7_IRQ_handler,default_interrupt_handler

   .weak      FMC_IRQ_handler
   .thumb_set FMC_IRQ_handler,default_interrupt_handler

   .weak      SDMMC1_IRQ_handler
   .thumb_set SDMMC1_IRQ_handler,default_interrupt_handler

   .weak      TIM5_IRQ_handler
   .thumb_set TIM5_IRQ_handler,default_interrupt_handler

   .weak      SPI3_IRQ_handler
   .thumb_set SPI3_IRQ_handler,default_interrupt_handler

   .weak      UART4_IRQ_handler
   .thumb_set UART4_IRQ_handler,default_interrupt_handler

   .weak      UART5_IRQ_handler
   .thumb_set UART5_IRQ_handler,default_interrupt_handler

   .weak      TIM6_DAC_IRQ_handler
   .thumb_set TIM6_DAC_IRQ_handler,default_interrupt_handler

   .weak      TIM7_IRQ_handler
   .thumb_set TIM7_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream0_IRQ_handler
   .thumb_set DMA2_Stream0_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream1_IRQ_handler
   .thumb_set DMA2_Stream1_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream2_IRQ_handler
   .thumb_set DMA2_Stream2_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream3_IRQ_handler
   .thumb_set DMA2_Stream3_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream4_IRQ_handler
   .thumb_set DMA2_Stream4_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream4_IRQ_handler
   .thumb_set DMA2_Stream4_IRQ_handler,default_interrupt_handler

   .weak      ETH_IRQ_handler
   .thumb_set ETH_IRQ_handler,default_interrupt_handler

   .weak      ETH_WKUP_IRQ_handler
   .thumb_set ETH_WKUP_IRQ_handler,default_interrupt_handler

   .weak      CAN2_TX_IRQ_handler
   .thumb_set CAN2_TX_IRQ_handler,default_interrupt_handler

   .weak      CAN2_RX0_IRQ_handler
   .thumb_set CAN2_RX0_IRQ_handler,default_interrupt_handler

   .weak      CAN2_RX1_IRQ_handler
   .thumb_set CAN2_RX1_IRQ_handler,default_interrupt_handler

   .weak      CAN2_SCE_IRQ_handler
   .thumb_set CAN2_SCE_IRQ_handler,default_interrupt_handler

   .weak      OTG_FS_IRQ_handler
   .thumb_set OTG_FS_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream5_IRQ_handler
   .thumb_set DMA2_Stream5_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream6_IRQ_handler
   .thumb_set DMA2_Stream6_IRQ_handler,default_interrupt_handler

   .weak      DMA2_Stream7_IRQ_handler
   .thumb_set DMA2_Stream7_IRQ_handler,default_interrupt_handler

   .weak      USART6_IRQ_handler
   .thumb_set USART6_IRQ_handler,default_interrupt_handler

   .weak      I2C3_EV_IRQ_handler
   .thumb_set I2C3_EV_IRQ_handler,default_interrupt_handler

   .weak      I2C3_ER_IRQ_handler
   .thumb_set I2C3_ER_IRQ_handler,default_interrupt_handler

   .weak      OTG_HS_EP1_OUT_IRQ_handler
   .thumb_set OTG_HS_EP1_OUT_IRQ_handler,default_interrupt_handler

   .weak      OTG_HS_EP1_IN_IRQ_handler
   .thumb_set OTG_HS_EP1_IN_IRQ_handler,default_interrupt_handler

   .weak      OTG_HS_WKUP_IRQ_handler
   .thumb_set OTG_HS_WKUP_IRQ_handler,default_interrupt_handler

   .weak      OTG_HS_IRQ_handler
   .thumb_set OTG_HS_IRQ_handler,default_interrupt_handler

   .weak      DCMI_IRQ_handler
   .thumb_set DCMI_IRQ_handler,default_interrupt_handler

   .weak      RNG_IRQ_handler
   .thumb_set RNG_IRQ_handler,default_interrupt_handler

   .weak      FPU_IRQ_handler
   .thumb_set FPU_IRQ_handler,default_interrupt_handler

   .weak      UART7_IRQ_handler
   .thumb_set UART7_IRQ_handler,default_interrupt_handler

   .weak      UART8_IRQ_handler
   .thumb_set UART8_IRQ_handler,default_interrupt_handler

   .weak      SPI4_IRQ_handler
   .thumb_set SPI4_IRQ_handler,default_interrupt_handler

   .weak      SPI5_IRQ_handler
   .thumb_set SPI5_IRQ_handler,default_interrupt_handler

   .weak      SPI6_IRQ_handler
   .thumb_set SPI6_IRQ_handler,default_interrupt_handler

   .weak      SAI1_IRQ_handler
   .thumb_set SAI1_IRQ_handler,default_interrupt_handler

   .weak      LTDC_IRQ_handler
   .thumb_set LTDC_IRQ_handler,default_interrupt_handler

   .weak      LTDC_ER_IRQ_handler
   .thumb_set LTDC_ER_IRQ_handler,default_interrupt_handler

   .weak      DMA2D_IRQ_handler
   .thumb_set DMA2D_IRQ_handler,default_interrupt_handler

   .weak      SAI2_IRQ_handler
   .thumb_set SAI2_IRQ_handler,default_interrupt_handler

   .weak      QUADSPI_IRQ_handler
   .thumb_set QUADSPI_IRQ_handler,default_interrupt_handler
   .weak      LPTIM1_IRQ_handler
   .thumb_set LPTIM1_IRQ_handler,default_interrupt_handler

   .weak      CEC_IRQ_handler
   .thumb_set CEC_IRQ_handler,default_interrupt_handler

   .weak      I2C4_EV_IRQ_handler
   .thumb_set I2C4_EV_IRQ_handler,default_interrupt_handler
   .weak      I2C4_ER_IRQ_handler
   .thumb_set I2C4_ER_IRQ_handler,default_interrupt_handler

   .weak      SPDIF_RX_IRQ_handler
   .thumb_set SPDIF_RX_IRQ_handler,default_interrupt_handler

   .weak      DFSDM1_FLT0_IRQ_handler
   .thumb_set DFSDM1_FLT0_IRQ_handler,default_interrupt_handler

   .weak      DFSDM1_FLT1_IRQ_handler
   .thumb_set DFSDM1_FLT1_IRQ_handler,default_interrupt_handler

   .weak      DFSDM1_FLT2_IRQ_handler
   .thumb_set DFSDM1_FLT2_IRQ_handler,default_interrupt_handler

   .weak      DFSDM1_FLT3_IRQ_handler
   .thumb_set DFSDM1_FLT3_IRQ_handler,default_interrupt_handler

   .weak      SDMMC2_IRQ_handler
   .thumb_set SDMMC2_IRQ_handler,default_interrupt_handler

   .weak      CAN3_TX_IRQ_handler
   .thumb_set CAN3_TX_IRQ_handler,default_interrupt_handler

   .weak      CAN3_RX0_IRQ_handler
   .thumb_set CAN3_RX0_IRQ_handler,default_interrupt_handler

   .weak      CAN3_RX1_IRQ_handler
   .thumb_set CAN3_RX1_IRQ_handler,default_interrupt_handler

   .weak      CAN3_SCE_IRQ_handler
   .thumb_set CAN3_SCE_IRQ_handler,default_interrupt_handler

   .weak      JPEG_IRQ_handler
   .thumb_set JPEG_IRQ_handler,default_interrupt_handler

   .weak      MDIOS_IRQ_handler
   .thumb_set MDIOS_IRQ_handler,default_interrupt_handler

.section  .text.default_interrupt_handler,"ax",%progbits
default_interrupt_handler:
Infinite_Loop:
  b  Infinite_Loop
.size  default_interrupt_handler, .-default_interrupt_handler

