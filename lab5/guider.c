/* begin assignment specification */

/* Convert the procedure exactly as given using the local variables local_var and temp_var
 * on the stack. */

void Fib (void)
{
    int local_var;
    int temp_var;
    local_var = global_var;
    if(local_var == 0) return;
    else if (lcoal_var == 1) return;
    else {
        global_var = local_var - 1;
        Fib();
        temp_var = global_var;
        global_var = local_var - 2;
        Fib();
        temp_var = temp_var + global_var;
        global_var = temp_var;
    }
    return;
}

/* end assignment specification */