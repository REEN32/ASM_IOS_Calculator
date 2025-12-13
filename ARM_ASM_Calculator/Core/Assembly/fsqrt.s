//
//  fsqrt.s
//  ARM_ASM_Calculator
//
//  Created by Герман Василевич on 3.12.25.
//

    .section __TEXT,__text,regular,pure_instructions
    .globl  _sqrt_floats
    .p2align    2

_sqrt_floats:
    fsqrt    s0, s0
    ret
