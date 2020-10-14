/* begin assignment specification */

AtoI()
{
    sign = 1; /* initialize sign to positive */

    /* skip over leading spaces and tabs */
    while (*ascii == ’ ’ || *ascii == ’\t’)
        ascii++;

    /* check for a plus or minus sign */
    if (*ascii == ’+’)
        ascii++; /* found a plus sign */
    else if (*ascii == ’-’)
    {
        sign = -1; /* found a minus sign */
        ascii++;
    }

    *intptr = 0; /* stores the value calculated below */

    /* skip to the ones place of the digit */
    for (i = 0; ascii[i] >= ’0’ && ascii[i] <= ’9’; i++);

    i--; /* back up to the ones place */

    multiplier = 1; /* set multiplier for ones place */
    for (; i >= 0; i--)
    {
        *intptr += multiplier * (ascii[i] - ’0’);
        multiplier *= 10; /* inc multiplier by factor of 10 */
    }

    /* multiply in the sign */
    *intptr = *intptr * sign;
}

/* end assignment specification */