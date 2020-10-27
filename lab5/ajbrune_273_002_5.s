/* begin assembly solution */

/*
* FUNCTION     Fib
* ARGUMENTS    N/A (We are using global variables)
* RETURNS      N/A
* PURPOSE      This function handles the varying variables in the main function (i) and determins the Fibonacci sequence.
*/
.globl Fib
.type Fib,@function
Fib:
	/* prolog */
	pushl %ebp
	pushl %ebx
	movl %esp, %ebp
	subl $8, %esp   # 4-bytes of memory for two ints
	                # -4(%ebp) - local_var (int)
	                # -8(%ebp) - temp_var (int)

    /* put code here */
    movl global_var, %eax
    movl %eax, -4(%ebp) # local_var = global_var
    cmp $0, %eax
    je return           # if (local_var == 0)
    cmp $1, %eax
    je return           # if (local_var == 1)
    subl $1, %eax
    movl %eax, global_var # global_var = local_var - 1;

    call Fib
    movl global_var, %eax
    movl %eax, -8(%ebp)
    movl -4(%ebp), %eax
    subl $2, %eax           # local_var -= 2
    movl %eax, global_var   # global_var = local_var - 2

    call Fib
    movl global_var, %eax   # eax = global_var
    movl -8(%ebp), %ebx
    addl %eax, %ebx         # ebx += eax
    movl %ebx, global_var   # global_var = temp_var
    jmp return

	return:
	/* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp

	ret
/* end assembly stub */