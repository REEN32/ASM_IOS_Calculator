//
//  fsub.s
//  ARM_ASM_Calculator
//
//  Created by Герман Василевич on 2.12.25.
//

    .section __TEXT,__text,regular,pure_instructions
    .globl  _sub_floats
    .p2align    2

_sub_floats:
    fsub    s0, s0, s1       
    ret
