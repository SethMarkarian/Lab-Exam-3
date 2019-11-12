		;r0:		int x
		;r1:		int y
		;r2:		int z
		;r3:		int*p
		;r4:		int size
		
		add		r0, r0, #6
		add		r1, r1, #9
		add		r2, r2, #9
		add		r4, r4, #5
		
		add		r9, r9, #24
		sub		sp, sp, r9
		mov		r6, #3
		str		r6, [sp, #4]
		mov		r6, #7
		str		r6, [sp, #8]
		mov		r6, #5
		str		r6, [sp, #12]
		mov		r6, #6
		str		r6, [sp, #16]
		mov		r6, #55
		str		r6, [sp, #20]
		mov		r6, sp
		str		r3, [sp, #0] ;points r3 to front of the stack (first int element)
		;____________________________________________________________
		
start	bl		max
		
max		cmp		r0, r1 ;compare both registers
		bgt		greater1 ;if greater go to greater1
		blt		greater2 ;if less than, go to greater2
		b		greater1 ;if equal, doesn't matter
		
greater1	cmp		r0, r2
		bgt		greater1f ;if greater go to greater1f
		blt		greater3f ;if less than, go to greater3f
		b		greater3f ;if equal, doesn't matter
		
greater2	cmp		r1, r2
		bgt		greater2f ;if greater go to greater2f
		blt		greater3f ;if less than, go to greater3f
		b		greater3f ;if equal, doesnt matter
		
greater1f	mov		r5, r0 ;set max to r5
		b		doneMax ;start finding in array
		
greater2f	mov		r5, r1 ;set max to r5
		b		doneMax ;start finding in array
		
greater3f	mov		r5, r2 ;set max to r5
		b		doneMax ;start finding in array
		
doneMax	bl		find ;find in array
		
find		mov		r6, #4 ;loading base address to a register
		add		r12, r12, #0 ;set r12 to 0
		bl		loop
		
loop		ldr		r7, [sp, r6] ;loops over array
		cmp		r4, #0 ;checks to see if end is reached
		beq		doneFind ;not found
		cmp		r7, r5 ;checks if number is max
		beq		found ;found
		add		r6, r6, #4 ;move by 4
		sub		r4, r4, #1 ;subtracts from size
		b		loop
		
doneFind	mov		r14, r12
		end
		
found	add		r12, r12, #1
		mov		r14, r12
		end
		
		
