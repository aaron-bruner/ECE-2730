/* begin assembly stub */

/*
*   Just a side note: I messed up my cmp statements so they're all backwards.
*   My easy fix was to just invert all of the logical statements instead of rewriting
*   a handfull of the code... It still works so I hope that is all that matters. I know
*   that it's a bit more difficult to read and that's my bad. I hope the comments help.
*/


/*
* FUNCTION     classify
* ARGUMENTS    N/A (We are using global variables)
* RETURNS      N/A
* PURPOSE      This function determines what type of triagnle the user input using basic arithmetic.
*
*             if tri_type is 0: it is not a triangle
*                            1: equillateral triangle
*                            2: isosceles triangle
*                            3: scalene triangle
*             A quick note: the driver files does not handle invalid input such as special characters. Inputing things
*             like #, $, %, * or other character that are not letters will cause issues with the program.
*/
.globl classify
.type classify,@function
classify:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp

    movl i, %eax
    cmpl $0, %eax
    je notTriangle        # First we want to check if i == 0; if so we execute that code
    movl j, %eax
    cmpl $0, %eax
    je notTriangle        # Now, we are going to repear for j and k. If any of them are true we go to notTriangle
    movl k, %eax
    cmpl $0, %eax
    je notTriangle

    movl $0, %eax
    movl %eax, match    #match = 0;

    movl i, %eax
    cmpl j, %eax
    je matchPlusOne # if i == j
    back1:
    cmpl k, %eax
    je matchPlusTwo # if i == k
    back2:
    movl j, %eax
    cmpl k, %eax
    je matchPlusThree # if j == k
    back3:

    movl match, %eax # we will try to keep match in eax as much as we can
    cmpl $0, %eax
    je notMatch    # if match is still 0 then we skip the if (match) block
    cmpl $1, %eax  # otherwise, we wan to see if match is 1
    je matchOne

    // else statemnt for (match == 1)
    cmpl $2, %eax
    je matchIsTwo # if match == 2 then skip to else statement
    cmpl $6, %eax # if match != 2 then continue with if statemnts (eax is still match)
    je equilateralTriangle

    movl j, %eax # this is the else statement for if (match == 6)
    addl k, %eax
    cmpl %eax, i
    jnle notTriangle

    movl $2, tri_type # Isoceles Triangle (two sides the same)
    jmp return

    notTriangle:
        movl $0, %eax
        movl %eax, tri_type # tri_type = 0
        jmp return

    equilateralTriangle:
        movl $1, %eax
        movl %eax, tri_type # tri_type = 1
        jmp return

    matchPlusOne:
        addl $1, match # match += 1
        jmp back1

    matchPlusTwo:
        addl $2, match # match += 2
        jmp back2

    matchPlusThree:
        addl $3, match # match += 3
        jmp back3

    matchOne:
        movl j, %ebx
        addl i, %ebx
        cmpl %ebx, k # !((j+i) <= k)
        jnle notTriangle

    matchIsTwo: # If match is two and we know it's a triangle then it must be isoceles
        movl i, %eax
        addl k, %eax
        cmpl %eax, j
        jnle notTriangle # !((i+k) <= j)
        movl $2, tri_type # Isoceles Triangle
        jmp return

    notMatch:
        movl i, %eax
        addl j, %eax
        cmpl %eax, k
        jnle notTriangle    # !((i+j) <= k)
        movl j, %eax
        addl k, %eax        #     OR
        cmpl %eax, i
        jnle notTriangle    # !((j+k) <= i)
        movl i, %eax
        addl k, %eax        #     OR
        cmpl %eax, j
        jnle notTriangle    # !((i+k) <= j)
        movl $3, tri_type   # If all fail then that means it must be scalene
        jmp return


    return:
    /* epilog */
    movl %ebp, %esp
    popl %ebx
    popl %ebp
    ret

/* declare variables here */

.comm i, 4
.comm j, 4
.comm k, 4
.comm tri_type, 4
.comm match, 4

/* end assebmly stub */