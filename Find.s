			;r0:		int* p
			;r1:		int x
			;r2:		int size
			add		r1, r1, #55
			add		r2, r3, #5
			
			
createStack	add		r9, r9, #20 ;setup
			add		r9, r9, r4
			sub		sp, sp, r9
			mov		r5, #3
			str		r5, [sp, #0]
			mov		r5, #7
			str		r5, [sp, #4]
			mov		r5, #5
			str		r5, [sp, #8]
			mov		r5, #6
			str		r5, [sp, #12]
			mov		r5, #55
			str		r5, [sp, #16]
			mov		r5, sp
			str		r0, [sp, #0] ;r0 points to first element
			bl		find
			end
			
find			mov		r5, #0 ;loading base address to a register
			add		r12, r12, #0 ;sets r12 to 0
			b		loop
			
loop			ldr		r6, [sp, r5] ;loops over array
			cmp		r2, #0 ;checks to see if end is reached
			beq		done ;found end
			cmp		r6, r1 ;found integer
			beq		found ;found
			add		r5, r5, #4
			sub		r2, r2, #1 ;subtracts from size
			b		loop
			
done			mov		pc, r14
			
found		add		r12, r12, #1
			mov		r14, r12
			
