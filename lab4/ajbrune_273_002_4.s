/* begin assembly solution */

/* Just a side note; I had issues working on this before class since the CU VPN went down. You asked us to post that here. */

/*
* FUNCTION     AtoI
* ARGUMENTS    N/A (We are using global variables)
* RETURNS      N/A
* PURPOSE      This function handles the input from the stdin pipeline and does some checks to ensure we reprint the same ASCII representation.
*/
.globl AtoI
.type AtoI,@function
AtoI:
	/* prolog */
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	/* put code here */

	movl $1, sign

	whileSpace:
		movl ascii, %eax
		cmpb $32, (%eax) # *ascii == ' '
		jne whileTab # if ascii != ' ' go to whileTab
		addl $1, ascii
		jmp whileSpace
	whileTab:
		movl ascii, %eax
		cmpb $9, (%eax) # *ascii == '\t'
		jne ifPlus # (exit loop)
		addl $1, ascii
		jmp whileSpace # return to the top of the while loop
	ifPlus:
		movl ascii, %eax
		cmpb $43, (%eax) # *ascii == '+'
		jne ifMinus
		addl $1, ascii
	ifMinus:
		movl ascii, %eax
		cmpb $45, (%eax) # *ascii == '-'
		jne intptrNULL
		movl $-1, sign
		addl $1, ascii
	intptrNULL:
		movl intptr, %eax
		movl $0, (%eax) # *intptr = 0
		movl $0, i
	for:
		movl $0, %eax
		movl ascii, %ebx
		movl i, %edi
		movb (%ebx, %edi, 1), %al #base indexing into an 8 bit register
		cmpb $48, %al # %al == '0'
		jnge onesPlace
		cmpb $57, %al # %al == '9'
		jg onesPlace
		addl $1, i
		jmp for # return to the top of for
	onesPlace:
		addl $-1, i # back up to the one's place
		movl $1, multiplier # set multiplier for one's place
	for2:
		cmp $0, i # i >= 0
		jl multSigns

		movl $0, %eax
		movl ascii, %ebx
		movl $0, %ecx
		movl i, %edi

		movb (%ebx, %edi, 1), %al #base indexing into an 8 bit register
		subb $48, %al # (ascii[i] - '0')
		mull multiplier
		movl $0, %ecx
		movl intptr, %ebx
		addl %eax, (%ebx) # *intptr += %eax

		movl multiplier, %eax
		movl $10, %edx
		mull %edx
		movl %eax, multiplier # multiplier *= 10

		addl $-1, i
		jmp for2 # return to start of for2 loop
	multSigns:
		movl intptr, %ebx
		movl (%ebx), %eax   # dereferenced intptr
		mull sign           # %eax = %eax * sign -> %eax = *intptr * sign
		movl %eax, (%ebx)   # move the value in %eax back to the pointer variable intptr

	return:
		/* epilog */
		popl %edi
		popl %esi
		popl %ebx
		movl %ebp, %esp
		popl %ebp
		ret

/* end assembly stub */
