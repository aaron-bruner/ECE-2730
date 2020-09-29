void classify(void) {
    /*
     * Convert the following C code to equivalent assembly.
     * Everywhere you see "return" replace with "jmp return" Don't
     * forget to declare "match" in the area at the bottom. Note
     * that the C driver defines i, j, k, and tri_type, so the
     * assembly code does not need to.
     */

    if (i == 0 || j == 0 || k == 0) {
        tri_type = 0; /* can't be a triangle */
        return;
    }

    /* count matching sides */
    match = 0;
    if (i == j) match += 1;
    if (i == k) match += 2;
    if (j == k) match += 3;

    /* select possible scalene triangles */
    if (match) {
        if (match == 1) {
            if ((i+j) <= k) {
                tri_type = 0; /* Not a triangle */
                return;
            }
        }
        else {
            if (match != 2) {
                if (match == 6) {
                    tri_type = 1; /* Equilateral triangle */
                    return;
                }
                else {
                    if ((j+k) <= i) {
                        tri_type = 0; /* Not a triangle */
                        return;
                    }
                } /* end of if (match == 6)... else */
            } else /* else for if (match != 2)... else */
            {
                if((i+k) <= j) {
                    tri_type = 0; /* Not a triangle */
                    return;
                }
            } /* end of if (match != 2)... else */
        } /* end of if (match == 1)... else */

        tri_type = 2; /* Isosceles Triangle */
        return;
    } /* end of if (match) */

    /* check to see if this is a triangle */
    if ((i+j) <= k || (j+k) <= i || (i+k) <= j) {
        tri_type = 0; /* Not a triangle */
        return;
    }

    tri_type = 3; /* Scalene triangle */
    return;
} /* end of void classify (void) */

/* end assignment specification */