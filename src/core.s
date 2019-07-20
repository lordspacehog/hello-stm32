.syntax unified
.cpu cortex-m7
.fpu fpv5-d16
.thumb

.global reset_handler
/*
 * The Reset handler. Called on reset.
 */
.section .text.reset_handler,"ax",%progbits
.type reset_handler, %function
reset_handler:
	// Set the stack pointer to the end of the stack.
	// The '_estack' value is defined in our linker script.
	LDR  sp, =_estack
	MOV r0, #0
	LDR r1, =_sdata
	LDR r2, =_edata
	LDR r3, =_sidata
	B copy_sidata_loop

copy_sidata:
	  // Offset the data init section by our copy progress.
	LDR  r4, [r3, r0]
	// Copy the current word into data, and increment.
	STR  r4, [r1, r0]
	ADDS r0, r0, #4

	copy_sidata_loop:
		// Unless we've copied the whole data section, copy the
		// next word from sidata->data.
		ADDS r4, r0, r1
		CMP  r4, r2
		BCC  copy_sidata
	// prepare for zeroing bss
	MOVS r0, #0
	LDR  r1, =_sbss
	LDR  r2, =_ebss
	B    reset_bss_loop

reset_bss:
	// Store a 0 and increment by a word.
	STR  r0, [r1]
	ADDS r1, r1, #4

	reset_bss_loop:
		// We'll use R1 to count progress here; if we aren't
		// done, reset the next word and increment.
		CMP  r1, r2
		BCC  reset_bss

// enter main loop
	bl SystemInit
	bl __libc_init_array
	bl main
	bx lr
.size reset_handler, .-reset_handler

