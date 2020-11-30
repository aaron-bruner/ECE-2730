/* begin assembly stub */

/*
* FUNCTION     Factorial
* ARGUMENTS    A single integer value which is 4 bytes
* RETURNS      A single integer value which is 4 bytes
* PURPOSE      This function takes the input integer value and multiplies it by n-1 until we reach 1.
*/
.globl Factorial
.type Factorial, @function

/* -4(%ebp) - local_var (int)
 * 12(%ebp) - n (int)
*/

Factorial:
    /* prolog */
	pushl %ebp			# standard writes to stack
	pushl %ebx
	movl %esp, %ebp
	subl $4, %esp       # 4-bytes of memory for local int
	                    # -4(%ebp) - local variable (int)

	movl 12(%ebp), %ecx	# %ecx = n;

	cmp $0, %ecx		# if(n == 0)
	je ret_1            #      OR
	cmp $1, %ecx		#   (n == 1)
	je ret_1
	jmp else

    ret_1:                  # return 1;

        movl $1, %eax
        jmp return

    else:					# return n * Factorial(n-1);
        movl %ecx, -4(%ebp) # move n to local variable
        subl $1, %ecx
        pushl %ecx

        call Factorial

        movl -4(%ebp), %ecx	# %ecx = n;
        mull %ecx			# n * Factorial(n-1)
        jmp return          # since mull puts value in A register we don't need to move it, just return

    return:
        /* epilog */
        movl %ebp, %esp
        popl %ebx
        popl %ebp

ret

/* end assembly stub */