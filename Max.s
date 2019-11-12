		;r0,r1,r2	are the parameters to max
		
setup	add		r0, r0, #7
		add		r1, r1, #8
		add		r2, r2, #8
		
		
max		cmp		r0, r1 ;compare both registers
		bgt		greater1 ;if greater go to greater1
		blt		greater2 ;if less than, go to greater2
		bl		greater1 ;if equal, doesn't matter
		
		
greater1	cmp		r0, r2 ;compare
		bgt		greater1f ;if greater go to greater1f
		blt		greater3f ;if greater go to greater2f
		b		greater3f ;if equal
		
greater2	cmp		r1, r2
		bgt		greater2f ;if greater go to greater2f
		blt		greater3f ;if greater go to greater3f
		b		greater3f ;if equal
		
greater1f	mov		r12, r0
		b		done
		
greater2f	mov		r12, r1
		b		done
		
greater3f	mov		r12, r2
		b		done
		
done		mov		r14, r12
		end
