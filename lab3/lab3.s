/* begin assembly stub */

.globl classify
.type classify,@function
classify:
    /* prolog */
    pushl %ebp
    pushl %ebx
    movl %esp, %ebp



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

/* end assebmly stub */