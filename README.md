# ECE-2730 [Computer Organization Laboratory]

## Course Description
The purpose of ECE 273 is to teach you the basics of Intel 80x86 assembly language. You will learn in ECE-2720 lecture that assembly language (or simply ”assembly”) is important because it is the principal link between the software world of high-level languages like C and Java and the hardware world of CPU design. Assembly language is the lowest-level, human-readable programming medium we can use to express complete application programs. Assembly language gives full access to the programmable features of the hardware, so a good understanding of it will provide valuable insight into the fundamentals of CPU design, the operation of the datapath, and program execution.

###### Lab 1 [Compiling and Testing Assembly Code]
The goal of Lab 1 is simply to introduce you to the basic tools and procedures you will use to write,
assemble, link, execute, and debug your programs. The task is simple: create an assembly program and
run it to demonstrate what it does. If you are already familiar with the UNIX operating system, this
assignment will be trivial.

###### Lab 2 [Simple Assignments and Arithmetic]
In this lab we will begin to explore the details of assembly language by looking at simple expression
evaluation. We will provide you with a C program that calls assembly language routines that you
will write. You need not worry about how data is passed between the C and assembly code we have
taken care of that, but you will later learn how to implement such code in assembly. The assignment is
straightforward implement simple arithmetic operations in assembly. More complex programs involving
pointers, arrays, data structures, and function calls and returns will be discussed as we progress through
the later labs.

###### Lab 3 [Control Statements]
In this lab we continue our tour of assembly language by adding control statements. Control statements
are coding structures that direct the flow of a program (the order in which the code is executed). In
assembly language there are no if ... then ... else, while, or for statements. Instead, there are two basic
primitives: jumps and conditional jumps (actually, there are some looping instructions, but we’ll cover
those after we understand the basics). The unconditional jmp instruction is, for all practical purposes,
a GOTO statement. You might recall from higher-level programming classes that the GOTO statement
is something which we should avoid. While this is largely true for high-level language applications as
it can result in what some call spaghetti code jump statements remain a primary tool of assembly
language.

###### Lab 4 [Addressing Modes: Arrays and Pointers]
In this lab we begin to explore different addressing modes. An addressing mode is the means by which
the computer selects the data that is used in an instruction. The addressing mode is determined by
the syntax with which you specify the instruction’s operand(s). Let’s begin by clarifying and expanding
upon these terms.

###### Lab 5 [Subroutines and the Stack]
In this lab, we will discuss subroutine structure. As you might know from C, subroutines (i.e. functions)
are the primary mechanisms for building programs out of smaller blocks. Rather than creating a program
with all its code in main(), it oftentimes makes sense to break code into smaller functional blocks.

###### Lab 6 [Subroutine Parameters and Returns]
In this lab, the objective is to learn about three things:
* how to pass arguments/parameters to assembly functions
* how to return values from assembly functions
* how to implement parameters and returns with recursive functions
